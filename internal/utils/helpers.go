package utils

import (
	"bufio"
	"io"
	"os"
	"regexp"
	"strings"
)

var JavaMapping = map[string]string{
	"Ljava/lang/Integer;":   "Int",
	"Ljava/lang/String;":    "String",
	"Ljava/lang/Boolean;":   "Boolean",
	"Ljava/util/List;":      "[Unknown]",
	"Ljava/lang/Long;":      "Int",
	"Ljava/lang/Double;":    "Float",
	"Ljava/lang/Float;":     "Float",
	"Ljava/util/ArrayList;": "[Unknown]",
	"C":                     "String",
	"D":                     "Float",
	"F":                     "Float",
	"I":                     "Int",
	"J":                     "Int",
	"Z":                     "Boolean",
}

var UNKNOWN_TYPE = "Unknown"

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

func GetFieldLineMap(fileContent string) map[string]string {
	fieldMap := make(map[string]string)

	fieldLines := GetFieldsLines(fileContent)
	for _, line := range fieldLines {
		trLine := TransformFieldLine(line)
		if trLine.IsOk {
			fieldMap[trLine.Value.A] = trLine.Value.B
		}
	}

	return fieldMap
}

func GetFieldAccess(lines []string) ([]string, map[string]string) {
	flag := false

	toStringRegex := regexp.MustCompile(`method public (final )?toString`)
	stringRegex := regexp.MustCompile(`const-string.+?"(.*?)"`)
	contentRegex := regexp.MustCompile(`([a-zA-Z]+\()?([a-zA-Z0-9=\s,]+)\)?`)

	nullFields := []string{}
	valueFields := make(map[string]string)

	subsearch := false

	for idx, line := range lines {
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
			subsearch = true
			m := stringRegex.FindStringSubmatch(line)
			if len(m) != 2 {
				continue
			}
			contents := contentRegex.FindAllStringSubmatch(m[1], -1)
			if len(contents) == 0 || len(contents[0]) != 3 {
				continue
			}
			lastField := strings.Trim(Last(strings.Split(contents[0][2], ",")), "\"=) ")

			for i := idx + 1; i < len(lines); i++ {
				if strings.HasPrefix(strings.TrimSpace(lines[i]), "const-string") {
					// string reached before subsearch gave a result
					nullFields = append(nullFields, strings.TrimRight(Last(strings.Split(line, " ")), "\"="))
					subsearch = false
					break
				}

				if strings.HasPrefix(strings.TrimSpace(lines[i]), "iget") {
					r := regexp.MustCompile(`->(.+?):`)
					obfFieldname := r.FindStringSubmatch(lines[i])
					if len(obfFieldname) != 2 {
						continue
					}

					subsearch = false
					valueFields[lastField] = obfFieldname[1]
					break
				}
			}
			if subsearch {
				nullFields = append(nullFields, lastField)
				subsearch = false
			}
		}
	}

	return nullFields, valueFields

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
func GetStrings(lines []string) Result[string] {
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

	if len(s) == 0 {
		return Err[string]()
	}

	return Ok(s)
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
		fields = append(fields, &Field{Name: kv[0], DefaultValue: kv[1], JavaType: "", GqlType: ""})
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
