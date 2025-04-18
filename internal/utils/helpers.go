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
	secondSplit := strings.Split(Last(firstSplit), ":")

	if len(secondSplit) < 2 {
		return Err[Tuple[string]]()
	}

	return Ok(Tuple[string]{A: secondSplit[0], B: secondSplit[1]})
}

func GetFieldAccess(lines []string) (string, []string) {
	className := ""
	fields := []string{}

	flag := false

	toStringRegex := regexp.MustCompile(`method public (final )?toString`)

	for _, line := range lines {
		if strings.HasPrefix(line, ".class") {
			spl := strings.Split(line, " ")
			className = Last(spl)
		}

		if !flag && toStringRegex.MatchString(line) {
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

func GetStrings(lines []string) string {
	flag := false
	stringRegex := regexp.MustCompile(`const-string.+?"(.*?)"`)
	toStringRegex := regexp.MustCompile(`method public (final )?toString`)

	s := ""
	for _, line := range lines {
		if !flag && toStringRegex.MatchString(line) {
			flag = true
			continue
		}

		if !flag {
			continue
		}

		if strings.HasPrefix(strings.TrimSpace(line), "const-string") {
			m := stringRegex.FindStringSubmatch(line)
			if len(m) != 2 {
				continue
			}
			s += m[1]
		}
	}

	return s
}

func ExtractTypes(fullString string) *ExtractedType {

	r := regexp.MustCompile(`(.+?)\((.+?)\)`)
	m := r.FindStringSubmatch(fullString)

	if len(m) == 0 {
		return nil
	}

	typeName := m[1]
	spl := strings.Split(m[2], ",")

	fields := []*Field{}
	for _, field := range spl {
		kv := strings.Split(strings.TrimSpace(field), "=")
		fields = append(fields, &Field{Name: kv[0], DefaultValue: kv[1], JavaType: ""})
	}

	return &ExtractedType{TypeName: typeName, Fields: fields}
}

func Last[T any](array []T) T {
	return array[len(array)-1]
}
