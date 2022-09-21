class BookingModel{
  final int id;
  final String userId;
  final String hotelId;
  final String type;

  const BookingModel({
    required this.id,
    required this.userId,
    required this.hotelId,
    required this.type,
  });
}