package utils

import (
	"bufio"
	"io"
	"os"
	"slices"
	"testing"
)

func TestGetFieldsLines(t *testing.T) {
	f, err := os.Open("testdata/example.smali")
	if err != nil {
		t.Error(err)
	}
	testInput, _ := io.ReadAll(f)

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
	f, err := os.Open("testdata/example.smali")
	if err != nil {
		t.Error(err)
	}
	scanner := bufio.NewScanner(bufio.NewReader(f))
	lines := []string{}
	for scanner.Scan() {
		lines = append(lines, scanner.Text())
	}

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
	f, err := os.Open("testdata/example.smali")
	if err != nil {
		t.Error(err)
	}
	scanner := bufio.NewScanner(bufio.NewReader(f))
	lines := []string{}
	for scanner.Scan() {
		lines = append(lines, scanner.Text())
	}

	s := GetStrings(lines)
	expected := "TaxonomyTopic1(id=, displayName=)"
	if s != expected {
		t.Error("expected", expected, "got", s)
	}
}

func TestExtractTypes(t *testing.T) {
	lines := getLines("testdata/example.smali", t)
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

func getLines(filepath string, t *testing.T) []string {
	f, err := os.Open(filepath)
	if err != nil {
		t.Error(err)
	}
	scanner := bufio.NewScanner(bufio.NewReader(f))
	lines := []string{}
	for scanner.Scan() {
		lines = append(lines, scanner.Text())
	}
	return lines
}

func getFileContent(filepath string, t *testing.T) string {
	f, err := os.Open(filepath)
	if err != nil {
		t.Error(err)
	}

	content, err := io.ReadAll(f)
	if err != nil {
		t.Error(err)
	}

	return string(content)
}
