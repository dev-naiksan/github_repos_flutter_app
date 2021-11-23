class UiResult {}

class UiSuccess<T> extends UiResult {
  final T data;

  UiSuccess(this.data);
}

class UiFailure extends UiResult {
  final String message;

  UiFailure(this.message);
}
