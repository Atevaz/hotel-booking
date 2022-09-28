class BookingUpdateParamModel {
  final String token;
  final String type;
  final int bookingId;

  const BookingUpdateParamModel({
    required this.token,
    required this.type,
    required this.bookingId,
  });

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'booking_id': bookingId,
    };
  }
}
