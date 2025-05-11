package utils

import (
	"bufio"
	"os"
	"slices"
	"testing"
)

func TestGetEnumName(t *testing.T) {
	f, err := os.Open("testdata/enum.smali")
	if err != nil {
		t.Error(err)
	}
	scanner := bufio.NewScanner(bufio.NewReader(f))
	lines := []string{}
	for scanner.Scan() {
		lines = append(lines, scanner.Text())
	}

	res := GetEnumName(lines[0])
	if !res.IsOk {
		t.Error()
	}

	if *res.Value != "Lcom/reddit/mod/temporaryevents/models/TemporaryEventFields$TempEventBoolean;" {
		t.Error()
	}
}

func TestExtractEnumValues(t *testing.T) {
	f, err := os.Open("testdata/enum.smali")
	if err != nil {
		t.Error(err)
	}
	scanner := bufio.NewScanner(bufio.NewReader(f))
	lines := []string{}
	for scanner.Scan() {
		lines = append(lines, scanner.Text())
	}

	enums := ExtractEnumValues(lines)

	if !slices.Equal(enums, []string{"FALSE", "NONE", "TRUE"}) {
		t.Error()
	}
}
