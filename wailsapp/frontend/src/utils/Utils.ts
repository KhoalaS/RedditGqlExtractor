class Result<T, E> {
  readonly error?: E;
  readonly value?: T;

  constructor(value?: T, error?: E) {
    this.value = value;
    this.error = error;
  }

  bind<U, F>(fn: (m: T) => Result<U, F>) {
    if (this.error) {
      return this;
    } else {
      return fn(this.value!);
    }
  }

  static ok<T, E>(value: T) {
    return new Result<T, E>(value);
  }

  static error<T, E>(error: E): Result<T, E> {
    return new Result<T, E>(undefined, error);
  }
}

function last<T>(array: T[]): Result<T, string> {
  if (array.length == 0) {
    return Result.error('Array was empty');
  }
  return Result.ok(array[array.length - 1]);
}

