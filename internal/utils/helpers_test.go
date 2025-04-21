package utils

import (
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

func TestGetFieldAccess(t *testing.T) {
	lines, _ := GetLines("testdata/example.smali")

	className, fields := GetFieldAccess(lines)
	if className != "LmB/hW;" {
		t.Error("expected LmB/hW; but got", className)
	}

	expected := []string{"a", "b"}
	if !slices.Equal(fields, expected) {
		t.Error("expected fields a and b got", fields)
	}
}

func TestGetStrings(t *testing.T) {
	lines, _ := GetLines("testdata/example.smali")

	s := GetStrings(lines)
	expected := "TaxonomyTopic1(id=, displayName=)"
	if s != expected {
		t.Error("expected", expected, "got", s)
	}
}

func TestExtractTypes(t *testing.T) {
	lines, _ := GetLines("testdata/example.smali")
	fullString := GetStrings(lines)

	extractedType := ExtractTypes(fullString)

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
