import 'package:booking_hotel/data/model/hotel_model.dart';
import 'package:booking_hotel/data/model/user_model.dart';
import 'package:equatable/equatable.dart';

class BookingModel extends Equatable {
  final int id;
  final int userId;
  final int hotelId;
  final String type;
  final UserModel user;
  final HotelModel hotel;

  const BookingModel({
    required this.id,
    required this.userId,
    required this.hotelId,
    required this.type,
    required this.user,
    required this.hotel,
  });

  factory BookingModel.fromJson(dynamic json) => BookingModel(
        id: json['id'],
        userId: int.parse(json['user_id']),
        hotelId: int.parse(json['hotel_id']),
        type: json['type'],
        user: UserModel.fromJson(json['user']),
        hotel: HotelModel.fromJson(json['hotel']),
      );

  static List<BookingModel> fromJsonList(List<dynamic> json) {
    final result = <BookingModel>[];
    for (int i = 0; i < json.length; i++) {
      final model = BookingModel.fromJson(json[i]);
      result.add(model);
    }
    return result;
  }

  @override
  List<Object?> get props => [
        id,
        userId,
        hotelId,
        type,
        user,
        hotel,
      ];
}
