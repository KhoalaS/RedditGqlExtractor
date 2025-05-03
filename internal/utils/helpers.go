package utils

import (
	"bufio"
	"io"
	"os"
	"regexp"
	"strings"
)

// Extract the field lines e.g. ".field public final b:Ljava/lang/String;" from a smali file.
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

// Transforms a field line e.g. ".field public final b:Ljava/lang/String;"
// into a tuple containing the obfuscated fieldname and Java type (b, Ljava/lang/String;).
func TransformFieldLine(line string) Result[Tuple[string]] {
	firstSplit := strings.Split(line, " ")
	secondSplit := strings.Split(Last(firstSplit), ":")

	if len(secondSplit) < 2 {
		return Err[Tuple[string]]()
	}

	return Ok(Tuple[string]{A: secondSplit[0], B: secondSplit[1]})
}

func GetFieldAccess(lines []string) (string, []string, []string) {
	className := ""
	fields := []string{}

	flag := false

	toStringRegex := regexp.MustCompile(`method public (final )?toString`)

	nullFields := []string{}

	for idx, line := range lines {
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

		if line == ".end method" {
			break
		}

		if strings.HasPrefix(strings.TrimSpace(line), "const-string") {
			for i := idx + 1; i < len(lines); i++ {
				if strings.HasPrefix(strings.TrimSpace(lines[i]), "const-string") {
					// string reached before subsearch gave a result
					nullFields = append(nullFields, strings.TrimRight(Last(strings.Split(line, " ")), "\"="))
					break
				}

				if strings.HasPrefix(strings.TrimSpace(lines[i]), "iget") {
					r := regexp.MustCompile(`->(.+?):`)
					m := r.FindStringSubmatch(lines[i])
					if len(m) != 2 {
						continue
					}

					fields = append(fields, m[1])
					break
				}
			}
		}
	}

	return className, fields, nullFields

}

// Returns the obfuscated classname of a smali file, if the file is a class.
func GetObfClassName(firstLine string) Result[string] {
	if strings.HasPrefix(firstLine, ".class") {
		spl := strings.Split(firstLine, " ")
		return Ok(Last(spl))
	}

	return Err[string]()
}

// Returns the concatenated strings from a smali toString method,
// e.g. "GlobalMemoryApp(action=memory, androidMemoryEvent=null)"
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

		if line == ".end method" {
			break
		}

		if strings.HasPrefix(strings.TrimSpace(line), "const-string") {
			m := stringRegex.FindStringSubmatch(line)
			if len(m) != 2 {
				continue
			}
			s += m[1]
		}
	}

	if strings.HasSuffix(s, "=") {
		s += ")"
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
		if len(kv) == 1 {
			return nil
		}
		fields = append(fields, &Field{Name: kv[0], DefaultValue: kv[1], JavaType: ""})
	}

	return &ExtractedType{TypeName: typeName, Fields: fields}
}

// Returns the last element of a slice.
func Last[T any](array []T) T {
	return array[len(array)-1]
}

// Opens a file and returns a slice of the lines of that file.
func GetLines(filepath string) ([]string, error) {
	lines := []string{}

	f, err := os.Open(filepath)

	if err != nil {
		return lines, err
	}

	defer f.Close()

	scanner := bufio.NewScanner(bufio.NewReader(f))
	for scanner.Scan() {
		lines = append(lines, scanner.Text())
	}
	return lines, nil
}

// Opens a file and returns the content of the file as a string.
func GetFileContent(filepath string) (string, error) {
	f, err := os.Open(filepath)

	if err != nil {
		return "", err
	}

	defer f.Close()

	content, err := io.ReadAll(f)
	if err != nil {
		return "", err
	}

	return string(content), nil
}
