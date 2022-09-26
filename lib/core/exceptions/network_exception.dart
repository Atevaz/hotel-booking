class NetworkException implements Exception {
  final String arMessage;
  final String enMessage;

  const NetworkException({
    required this.enMessage,
    required this.arMessage,
  });
}
