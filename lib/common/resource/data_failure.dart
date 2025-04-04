class DataFailure {
  final int? code;
  final String? message;
  final dynamic error;

  DataFailure(this.code, this.message, this.error);

  const DataFailure._(this.code, this.message, this.error);
}
