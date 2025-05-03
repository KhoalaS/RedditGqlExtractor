package main

import (
	"bufio"
	"fmt"
	"log"
	"os"
	"strings"

	"github.com/KhoalaS/RedditGqlExtractor/internal/utils"
	"github.com/schollz/progressbar/v3"
)

func main() {

	logfile, _ := os.Create("extractor.log")
	defer logfile.Close()
	debugLogger := log.New(logfile, "DEBUG:", log.LstdFlags)

	//javaMapping := map[string]string{
	//	"Ljava/lang/Integer;":   "Int",
	//	"Ljava/lang/String;":    "String",
	//	"Ljava/lang/Boolean;":   "Boolean",
	//	"Ljava/util/List;":      "[Unknown]",
	//	"Ljava/lang/Long;":      "Int",
	//	"Ljava/lang/Double;":    "Float",
	//	"Ljava/lang/Float;":     "Float",
	//	"Ljava/util/ArrayList;": "[Unknown]",
	//	"C":                     "String",
	//	"D":                     "Float",
	//	"F":                     "Float",
	//	"I":                     "Int",
	//	"J":                     "Int",
	//	"Z":                     "Boolean",
	// }
	//

	enumNameMapping := make(map[string]string)
	enumValueMapping := make(map[string][]string)
	typeMapping := make(map[string]string)

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
			debugLogger.Println("error reading content of file", file)
			continue
		}

		content, err := utils.GetFileContent(file)
		if err != nil {
			debugLogger.Println("error reading content of file", file)
			continue
		}

		obfClassName := utils.GetObfClassName(lines[0])

		if !obfClassName.IsOk {
			debugLogger.Println("error reading obfuscated classname of", file)
			continue
		}

		fields := []string{}

		for _, line := range utils.GetFieldsLines(content) {
			trTuple := utils.TransformFieldLine(line)
			if !trTuple.IsOk {
				debugLogger.Fatal("Error transforming line:", line, "in file:", file)
			}
			fields = append(fields, trTuple.Value.B)
		}

		fullString := utils.GetStrings(lines)

		if len(fullString) == 0 {
			debugLogger.Println("error reading string segments of toString method in", file)
			continue
		}

		ex := utils.ExtractTypes(fullString)

		if ex == nil {
			debugLogger.Println("error extracting type in", file)
			continue
		}

		// TODO remove this
		if len(fields) != len(ex.Fields) {
			fmt.Println(file)
			os.Exit(-1)
		}

		for idx := range ex.Fields {
			if mappedType, ok := typeMapping[fields[idx]]; ok {
				ex.Fields[idx].JavaType = mappedType
			}
		}

		typeMapping[*obfClassName.Value] = ex.TypeName
	}

}
