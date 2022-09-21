class ServerException implements Exception {
  final String message;
  final int code;
  final String error;

  const ServerException({
    required this.message,
    required this.code,
    required this.error,
  });
}
