package utils

type Result[T any] struct {
	IsOk  bool
	Value *T
}

func Ok[T any](value T) Result[T] {
	return Result[T]{IsOk: true, Value: &value}
}

func Err[T any]() Result[T] {
	return Result[T]{IsOk: false, Value: nil}
}

func (m Result[T]) Bind(fn func(T) T) *T {
	if !m.IsOk {
		return nil
	}

	val := fn(*m.Value)
	return &val
}

type Tuple[T any] struct {
	A T
	B T
}

type ExtractedType struct {
	TypeName string
	Fields   []*Field
}

type Field struct {
	Name         string
	DefaultValue string
	JavaType     string
}
