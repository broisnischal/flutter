class BaseExceptionEntity {
  BaseExceptionEntity({
    this.success,
    this.stackTrace,
    this.message,
  });
  final bool? success;
  String? stackTrace;
  String? message;
}
