package main

import (
	"context"
	"encoding/json"
	"fmt"
	"io"
	"os"

	"github.com/KhoalaS/RedditGqlExtractor/internal/utils"
	"github.com/wailsapp/wails/v2/pkg/runtime"
)

var exTypes map[string]*utils.ExtractedType

// App struct
type App struct {
	ctx context.Context
}

// NewApp creates a new App application struct
func NewApp() *App {
	return &App{}
}

// startup is called when the app starts. The context is saved
// so we can call the runtime methods
func (a *App) startup(ctx context.Context) {
	a.ctx = ctx
}

// Greet returns a greeting for the given name
func (a *App) Greet(name string) string {
	return fmt.Sprintf("Hello %s, It's show time!", name)
}

func (a *App) OpenSchemaFile() SchemaResult {
	filter := []runtime.FileFilter{{
		Pattern: "*.json",
	}}
	dialogOptions := runtime.OpenDialogOptions{ShowHiddenFiles: true, Title: "Open file", Filters: filter}
	filepath, err := runtime.OpenFileDialog(a.ctx, dialogOptions)
	if err != nil {
		return SchemaResult{Error: err}
	}

	file, err := os.Open(filepath)
	if err != nil {
		return SchemaResult{Error: err}
	}

	filedata, err := io.ReadAll(file)
	if err != nil {
		return SchemaResult{Error: err}
	}

	err = json.Unmarshal(filedata, &exTypes)
	if err != nil {
		return SchemaResult{Error: err}

	}

	typeArray := make([]MinimalType, len(exTypes))

	i := 0
	for filename, _type := range exTypes {
		typeArray[i] = MinimalType{Typename: _type.TypeName, Filename: filename}
		i++
	}

	return SchemaResult{Data: typeArray, Error: nil}
}

func (a *App) GetType(filename string) utils.ExtractedType {
	return *exTypes[filename]
}

func (a *App) ToGQLType(_type utils.ExtractedType) string {
	gqlType := ""
	gqlType += "type " + _type.TypeName + " {\n"
	for _, field := range _type.Fields {
		gqlType += "\t" + field.Name + ": " + field.GqlType + "\n"
	}
	gqlType += "}\n"
	return gqlType
}

type MinimalType struct {
	Typename string `json:"typename"`
	Filename string `json:"filename"`
}

type SchemaResult struct {
	Data  []MinimalType `json:"data"`
	Error error         `json:"error"`
}
