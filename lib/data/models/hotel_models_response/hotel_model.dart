import 'package:booking_hotel/data/models/hotel_models_response/hotel_facility_model.dart';
import 'package:booking_hotel/data/models/hotel_models_response/hotel_image_model.dart';

class HotelModel {
  final int id;
  final String name;
  final String desc;
  final String price;
  final String address;
  final String latitude;
  final String longitude;
  final String rate;
  final List<HotelImageModel> images;
  final List<HotelFacilityModel> facilities;

  const HotelModel({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.rate,
    required this.images,
    required this.facilities,
  });
}
