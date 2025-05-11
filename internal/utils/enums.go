package utils

import (
	"regexp"
	"strings"
)

var enumRegex = regexp.MustCompile(`\.field public static final enum (.+?):(.+)`)
var enumClassRegex = regexp.MustCompile(`\.class public final enum Lcom/reddit`)

func GetEnumName(firstLine string) Result[string] {
	if enumClassRegex.MatchString(firstLine) {
		return Ok(Last(strings.Split(firstLine, " ")))
	}

	return Err[string]()
}

func ExtractEnumValues(lines []string) []string {

	values := []string{}

	for _, line := range lines {
		m := enumRegex.FindStringSubmatch(line)
		if len(m) > 0 {
			values = append(values, m[1])
		}
	}

	return values
}
