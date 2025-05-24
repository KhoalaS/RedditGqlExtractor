package main

import (
	"fmt"
	"os"

	"github.com/KhoalaS/RedditGqlExtractor/internal/utils"
)

func main() {
	argsWithoutProg := os.Args[1:]

	if len(argsWithoutProg) != 1 {
		return
	}

	file := argsWithoutProg[0]

	lines, err := utils.GetLines(file)
	if err != nil {
		fmt.Println("error reading content of file", file)
		return
	}

	content, err := utils.GetFileContent(file)
	if err != nil {
		fmt.Println("error reading content of file", file)
		return
	}

	obfClassName := utils.GetObfClassName(lines[0])

	if !obfClassName.IsOk {
		fmt.Println("error reading obfuscated classname of", file)
		return
	}

	fmt.Println("Obfuscated class name:", *obfClassName.Value)

	fields := utils.GetFieldLineMap(content)
	fmt.Println("Fields:")
	for key, field := range fields {
		fmt.Println("\t", key, field)
	}

	fullString := utils.GetStrings(lines)
	if !fullString.IsOk {
		fmt.Println("error reading string segments of toString method in", file)
		return
	}

	fmt.Println("FullString:", *fullString.Value)

	ex := utils.ExtractTypes(*fullString.Value)
	if ex == nil {
		fmt.Println("error extracting types from", file)
		return
	}

	nullFields, valueFields := utils.GetFieldAccess(lines)
	fmt.Println("Null fields:", nullFields)
	fmt.Println("Value fields:", valueFields)

	if len(valueFields) != len(fields) {
		fmt.Printf("Length difference: ValueFields(%d), Fields(%d)\n", len(valueFields), len(fields))
	}

	for _, field := range ex.Fields {
		fmt.Println("\t", field.Name, field.JavaType, field.DefaultValue)
	}

}
