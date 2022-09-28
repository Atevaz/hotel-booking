import 'package:equatable/equatable.dart';

class HotelImageModel extends Equatable {
  final int id;
  final int hotelId;
  final String image;

  const HotelImageModel({
    required this.id,
    required this.hotelId,
    required this.image,
  });

  factory HotelImageModel.fromJson(dynamic json) => HotelImageModel(
        id: json['id'],
        hotelId: int.parse(json['hotel_id']),
        image: json['image'],
      );

  static List<HotelImageModel> fromJsonList(List<dynamic> json) {
    final result = <HotelImageModel>[];
    for (int i = 0; i < json.length; i++) {
      final model = HotelImageModel.fromJson(json[i]);
      result.add(model);
    }
    return result;
  }

  @override
  List<Object?> get props => [
        id,
        hotelId,
        image,
      ];
}
