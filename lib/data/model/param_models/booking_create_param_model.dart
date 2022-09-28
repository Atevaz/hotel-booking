class BookingCreateParamModel {
  final String token;
  final int hotelId;

  const BookingCreateParamModel({
    required this.token,
    required this.hotelId,
  });

  Map<String, dynamic> toJson() {
    return {
      'hotel_id': hotelId,
    };
  }
}
