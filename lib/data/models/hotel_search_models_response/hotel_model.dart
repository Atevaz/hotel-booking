import 'package:booking_hotel/data/models/hotel_search_models_response/facility_model.dart';
import 'package:booking_hotel/data/models/hotel_search_models_response/hotel_image_model.dart';

class HotelModel {
  int? id;
  final String name;
  final String desc;
  final double price;
  final String address;
  final double latitude;
  final double longitude;
  final double rate;
  final List<HotelImageModel> images;
  final List<FacilityModel> facilities;

  HotelModel({
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

  factory HotelModel.fromMap(Map<String, dynamic> map) {
    final facilityList = <FacilityModel>[];
    final facList = map['facilities'] as List;
    for (int i = 0; i < facList.length; i++) {
      final model = FacilityModel.fromMap(facList[i]);
      facilityList.add(model);
    }
    final imageList = <HotelImageModel>[];
    final magList = map['hotel_images'] as List;
    for (int i = 0; i < magList.length; i++) {
      final model = HotelImageModel.fromMap(magList[i]);
      imageList.add(model);
    }
    return HotelModel(
        id: map['id'],
        name: map['name'],
        desc: map['description'],
        price: double.parse(map['price']),
        address: map['address'],
        latitude: double.parse(map['latitude']),
        longitude: double.parse(map['longitude']),
        rate: double.parse(map['rate']),
        images: imageList,
        facilities: facilityList);
  }
}
