package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"

	"github.com/KhoalaS/RedditGqlExtractor/internal/utils"
	"github.com/schollz/progressbar/v3"
)

func main() {
	candidateFile, err := os.Open("./candidates.txt")
	if err != nil {
		fmt.Errorf("could not open candidate file", err)
	}

	enumFile, err := os.Open("./enums.txt")
	if err != nil {
		fmt.Errorf("could not open enum file", err)
	}

	defer candidateFile.Close()
	defer enumFile.Close()

	enumScanner := bufio.NewScanner(enumFile)
	enumFiles := []string{}
	for enumScanner.Scan() {
		enumFiles = append(enumFiles, enumScanner.Text())
	}

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

	enumProgress := progressbar.Default(int64(len(enumFiles)))

	for _, file := range enumFiles {
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
			fmt.Println(*enumName.Value)
		}
		enumProgress.Add(1)
	}
}
