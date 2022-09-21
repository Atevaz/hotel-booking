class NetworkException implements Exception {
  final String message;

  const NetworkException({
    required this.message,
  });
}
