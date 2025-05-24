package main

import (
	"bufio"
	"encoding/json"
	"log"
	"os"
	"slices"
	"strings"

	"github.com/KhoalaS/RedditGqlExtractor/internal/utils"
	"github.com/schollz/progressbar/v3"
)

func main() {

	logfile, _ := os.Create("extractor.log")
	defer logfile.Close()
	warnLogger := log.New(logfile, "WARN:", log.LstdFlags)
	errorLogger := log.New(logfile, "ERROR:", log.LstdFlags)
	ioLogger := log.New(logfile, "IO:", log.LstdFlags)

	enumNameMapping := make(map[string]string)
	enumValueMapping := make(map[string][]string)
	typeMapping := make(map[string]string)
	fileToTypeMapping := make(map[string]*utils.ExtractedType)

	enumFiles, _ := utils.GetLines("./enums.txt")
	enumBar := progressbar.Default(int64(len(enumFiles)), "extract enums")

	for _, file := range enumFiles {
		enumBar.Add(1)

		f, _ := os.Open(file)
		scanner := bufio.NewScanner(bufio.NewReader(f))
		lines := []string{}
		for scanner.Scan() {
			lines = append(lines, scanner.Text())
		}

		enumName := utils.GetEnumName(lines[0])

		if enumName.IsOk {
			shortName := strings.TrimRight(utils.Last(strings.Split(*enumName.Value, "/")), ";")
			enumNameMapping[*enumName.Value] = shortName

			enumValues := utils.ExtractEnumValues(lines)
			enumValueMapping[*enumName.Value] = enumValues
		}
	}

	candidateFiles, _ := utils.GetLines("./candidates.txt")
	typeMappingBar := progressbar.Default(int64(len(candidateFiles)), "generate type mapping")

	for _, file := range candidateFiles {
		typeMappingBar.Add(1)

		lines, err := utils.GetLines(file)
		if err != nil {
			ioLogger.Println("error reading content of file", file)
			continue
		}

		content, err := utils.GetFileContent(file)
		if err != nil {
			ioLogger.Println("error reading content of file", file)
			continue
		}

		obfClassName := utils.GetObfClassName(lines[0])

		if !obfClassName.IsOk {
			errorLogger.Println("error reading obfuscated classname of", file)
			continue
		}

		fields := utils.GetFieldLineMap(content)

		fullString := utils.GetStrings(lines)
		if !fullString.IsOk {
			errorLogger.Println("error reading string segments of toString method in", file)
			continue
		}

		ex := utils.ExtractTypes(*fullString.Value)
		if ex == nil {
			errorLogger.Println("error extracting types from", file)
			continue
		}

		nullFields, valueFields := utils.GetFieldAccess(lines)

		if len(valueFields) != len(fields) {
			warnLogger.Printf("length difference in valuefields(%d) and fields(%d)\n", len(valueFields), len(fields))
		}

		for _, field := range ex.Fields {
			if slices.Contains(nullFields, field.Name) {
				field.DefaultValue = "null"
				continue
			}
			if len(field.DefaultValue) > 0 {
				continue
			}
			if _, ex := valueFields[field.Name]; ex {
				fieldClassname := fields[valueFields[field.Name]]
				if mappedType, ok := typeMapping[fieldClassname]; ok {
					field.JavaType = mappedType
					field.GqlType = mappedType
				} else if enumType, ok := enumNameMapping[fieldClassname]; ok {
					field.JavaType = enumType
					field.GqlType = enumType
				} else {
					field.JavaType = fieldClassname
					if mappedGqlType, ok := utils.JavaMapping[fieldClassname]; ok {
						field.GqlType = mappedGqlType
					} else {
						field.GqlType = utils.UNKNOWN_TYPE
					}
				}

			}
		}

		typeMapping[*obfClassName.Value] = ex.TypeName
		fileToTypeMapping[file] = ex
	}

	outfile, err := os.Create("out.json")
	if err != nil {
		ioLogger.Println("could not open output file")
		return
	}
	defer outfile.Close()
	data, err := json.Marshal(fileToTypeMapping)
	if err != nil {
		ioLogger.Println("could marshal output data")
		return
	}
	outfile.Write(data)

	enumOutfile, err := os.Create("out_enum.json")
	if err != nil {
		ioLogger.Println("could not open output file")
		return
	}
	defer enumOutfile.Close()
	data, err = json.Marshal(enumNameMapping)
	if err != nil {
		ioLogger.Println("could marshal output data")
		return
	}
	enumOutfile.Write(data)
}
