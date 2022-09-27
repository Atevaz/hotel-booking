import 'package:booking_hotel/data/models/hotel_data/hotel_facilities.dart';
import 'package:booking_hotel/data/models/hotel_data/hotel_images.dart';

class Hotel {
  int? id;
  String? name;
  String? description;
  String? price;
  String? address;
  String? longitude;
  String? latitude;
  String? rate;
  String? createdAt;
  String? updatedAt;
  List<HotelImages>? hotelImages;
  List<HotelFacilities>? hotelFacilities;

  Hotel(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.address,
      this.longitude,
      this.latitude,
      this.rate,
      this.createdAt,
      this.updatedAt,
      this.hotelImages,
      this.hotelFacilities});

  Hotel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    address = json['address'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    rate = json['rate'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['hotel_images'] != null) {
      hotelImages = <HotelImages>[];
      json['hotel_images'].forEach((v) {
        hotelImages!.add(HotelImages.fromJson(v));
      });
    }
    if (json['hotel_facilities'] != null) {
      hotelFacilities = <HotelFacilities>[];
      json['hotel_facilities'].forEach((v) {
        hotelFacilities!.add(HotelFacilities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['price'] = price;
    data['address'] = address;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['rate'] = rate;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (hotelImages != null) {
      data['hotel_images'] = hotelImages!.map((v) => v.toJson()).toList();
    }
    if (hotelFacilities != null) {
      data['hotel_facilities'] =
          hotelFacilities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
