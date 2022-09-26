class ServerException implements Exception {
  final String arMessage;
  final String enMessage;

  const ServerException({
    required this.enMessage,
    required this.arMessage,
  });
}
