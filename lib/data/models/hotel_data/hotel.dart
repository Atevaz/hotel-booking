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
        hotelImages!.add(new HotelImages.fromJson(v));
      });
    }
    if (json['hotel_facilities'] != null) {
      hotelFacilities = <HotelFacilities>[];
      json['hotel_facilities'].forEach((v) {
        hotelFacilities!.add(new HotelFacilities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['address'] = this.address;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['rate'] = this.rate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.hotelImages != null) {
      data['hotel_images'] = this.hotelImages!.map((v) => v.toJson()).toList();
    }
    if (this.hotelFacilities != null) {
      data['hotel_facilities'] =
          this.hotelFacilities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
