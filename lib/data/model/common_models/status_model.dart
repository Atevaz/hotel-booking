class StatusModel {
  final String type;
  final String arMessage;
  final String enMessage;

  const StatusModel({
    required this.type,
    required this.arMessage,
    required this.enMessage,
  });

  factory StatusModel.fromJson(Map<String, dynamic> json) {
    return StatusModel(
      type: '${json['type']}',
      arMessage: "${json['title']?['ar']}",
      enMessage: "${json['title']?['en']}",
    );
  }
}
