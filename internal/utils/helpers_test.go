package utils

import (
	"regexp"
	"slices"
	"strings"
	"testing"
)

func TestSplit(t *testing.T) {
	spl := strings.Split("Hello=", "=")
	slices.Equal(spl, []string{"Hello", ""})
}

func TestGetFieldsLines(t *testing.T) {
	testInput, _ := GetFileContent("testdata/example.smali")

	fieldLines := GetFieldsLines(string(testInput))
	t.Log(fieldLines)
	if len(fieldLines) == 0 {
		t.Error()
	}

	expected := []string{".field public final a:Ljava/lang/String;", ".field public final b:Ljava/lang/String;"}
	if !slices.Equal(fieldLines, expected) {
		t.Error()
	}
}

func TestTransformFieldLine(t *testing.T) {
	line := ".field private final choiceMetadata:LKL/a;"
	res := TransformFieldLine(line)

	if !res.IsOk {
		t.Error()
	}

	if res.Value.A != "choiceMetadata" || res.Value.B != "LKL/a;" {
		t.Error()
	}
}

func TestGetStrings(t *testing.T) {
	lines, _ := GetLines("testdata/example.smali")

	s := GetStrings(lines)
	expected := "TaxonomyTopic1(id=, displayName=)"
	if *s.Value != expected {
		t.Error("expected", expected, "got", s)
	}
}

func TestExtractTypes(t *testing.T) {
	lines, _ := GetLines("testdata/example.smali")
	fullString := GetStrings(lines)

	extractedType := ExtractTypes(*fullString.Value)

	if extractedType == nil {
		t.Error()
	}

	if extractedType.TypeName != "TaxonomyTopic1" {
		t.Error()
	}

	if len(extractedType.Fields) != 2 {
		t.Error()
	}

	if extractedType.Fields[0].Name != "id" || extractedType.Fields[1].Name != "displayName" {
		t.Error()
	}
}

func TestStringRegex(t *testing.T) {
	r := regexp.MustCompile(`([a-zA-Z]+\()?([a-zA-Z0-9=\s,]+)\)?`)
	testData := []string{"PostClick(noun=", ", comment=null, postFlair="}
	m := r.FindAllStringSubmatch(testData[0], -1)

	if !slices.Equal(m[0], []string{testData[0], "PostClick(", "noun="}) {
		t.Fail()
	}

	last := strings.Split(m[0][2], ",")
	t.Log(last)

	m = r.FindAllStringSubmatch(testData[1], -1)
	if !slices.Equal(m[0], []string{testData[1], "", testData[1]}) {
		t.Fail()
	}
}
