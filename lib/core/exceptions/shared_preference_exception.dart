class PreferenceException implements Exception {
  final String arMessage;
  final String enMessage;

  const PreferenceException({
    required this.enMessage,
    required this.arMessage,
  });
}
