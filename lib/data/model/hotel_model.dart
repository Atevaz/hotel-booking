import 'package:booking_hotel/data/model/facility_mode.dart';
import 'package:booking_hotel/data/model/hotel_image_model.dart';
import 'package:equatable/equatable.dart';

class HotelModel extends Equatable {
  final int id;
  final String name;
  final String description;
  final double price;
  final String address;
  final double longitude;
  final double latitude;
  final double rate;
  final List<HotelImageModel>? hotelImages;
  final List<FacilityModel>? hotelFacilities;

  const HotelModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.address,
    required this.longitude,
    required this.latitude,
    required this.rate,
    required this.hotelImages,
    required this.hotelFacilities,
  });

  factory HotelModel.fromJson(Map<String, dynamic> json) {
    final images = HotelImageModel.fromJsonList(json['hotel_images']);
    final facilities = FacilityModel.fromJsonList(
      json['facilities'] ?? json['hotel_facilities'],
    );
    return HotelModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: double.parse(json['price']),
      address: json['address'],
      longitude: double.parse(json['longitude']),
      latitude: double.parse(json['latitude']),
      rate: double.parse(json['rate']),
      hotelImages: images,
      hotelFacilities: facilities,
    );
  }

  static List<HotelModel> fromJsonList(List<dynamic> json) {
    final result = <HotelModel>[];
    for (int i = 0; i < json.length; i++) {
      final map = json[i] as Map<String, dynamic>;
      final model = HotelModel.fromJson(map);
      result.add(model);
    }
    return result;
  }

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        price,
        address,
        longitude,
        latitude,
        rate,
        hotelImages,
        hotelFacilities,
      ];
}
