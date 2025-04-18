package utils

type Result[T any] struct {
	isOk  bool
	value *T
}

func Ok[T any](value T) Result[T] {
	return Result[T]{isOk: true, value: &value}
}

func Err[T any]() Result[T] {
	return Result[T]{isOk: false, value: nil}
}

func (m Result[T]) Bind(fn func(T) T) *T {
	if !m.isOk {
		return nil
	}

	val := fn(*m.value)
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
