class ApiReturnValue<T> {
  final T? value;
  final String? message;

  const ApiReturnValue({this.message, this.value});
}
