package utils

import (
	"regexp"
	"strings"
)

func GetFieldsLines(fileContent string) []string {

	fieldsLines := []string{}

	fieldRegex := regexp.MustCompile(`# instance fields[\s\S]+?#`)
	fields := fieldRegex.FindString(fileContent)

	if fields == "" {
		return fieldsLines
	}

	r := regexp.MustCompile(`\.field.+?\n`)

	matches := r.FindAllString(fields, -1)

	for _, value := range matches {
		fieldsLines = append(fieldsLines, strings.TrimSpace(value))
	}

	return fieldsLines
}

func TransformFieldLine(line string) Result[Tuple[string]] {
	firstSplit := strings.Split(line, " ")
	secondSplit := strings.Split(last(firstSplit), ":")

	if len(secondSplit) < 2 {
		return Err[Tuple[string]]()
	}

	return Ok(Tuple[string]{a: secondSplit[0], b: secondSplit[1]})
}

func GetFieldAccess(lines []string) (string, []string) {
	className := ""
	fields := []string{}

	flag := false

	toStringRegex := regexp.MustCompile(`method public (final )?toString`)

	for _, line := range lines {
		if strings.HasPrefix(line, ".class") {
			spl := strings.Split(line, " ")
			className = last(spl)
		}

		if toStringRegex.MatchString(line) {
			flag = true
			continue
		}

		if !flag {
			continue
		}

		if strings.HasPrefix(strings.TrimSpace(line), "iget") {

			r := regexp.MustCompile(`->(.+?):`)
			m := r.FindStringSubmatch(line)
			if len(m) != 2 {
				continue
			}

			fields = append(fields, m[1])
		}

	}

	return className, fields

}

func last[T any](array []T) T {
	return array[len(array)-1]
}
