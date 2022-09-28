class BookingFetchParamModel {
  final String token;
  final String type;
  final int count;
  final int page;

  const BookingFetchParamModel({
    required this.token,
    required this.type,
    required this.count,
    required this.page,
  });

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'count': count,
      'page': page,
    };
  }
}
