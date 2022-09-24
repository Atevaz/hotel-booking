class HotelImageModel {
  final int id;
  final int hotelId;
  final String image;

  const HotelImageModel({
    required this.id,
    required this.hotelId,
    required this.image,
  });

  factory HotelImageModel.fromMap(Map<String, dynamic> map) {
    return HotelImageModel(
      id: map['id'],
      hotelId: int.parse(map['hotel_id']),
      image: map['image'],
    );
  }
}
