import 'package:booking_hotel/data/models/hotel_data/hotel.dart';

import 'common_models/status_model.dart';

class BookingModel {
  StatusModel? status;
  Data? data;

  BookingModel({this.status, this.data});

  BookingModel.fromJson(Map<String, dynamic> json) {
    status =
    json['status'] != null ? StatusModel.fromJson(json['status']) : null;
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}


class Data {
  int? currentPage;
  List<DataList>? dataList;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  String? path;
  String? perPage;
  int? to;
  int? total;

  Data(
      {this.currentPage,
        this.dataList,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.path,
        this.perPage,
        this.to,
        this.total});

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      dataList = <DataList>[];
      json['data'].forEach((v) {
        dataList!.add(DataList.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }


}

class DataList {
  int? id;
  String? userId;
  String? hotelId;
  String? type;
  User? user;
  Hotel? hotel;

  DataList(
      {this.id,
        this.userId,
        this.hotelId,
        this.type,
        this.user,
        this.hotel});

  DataList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    hotelId = json['hotel_id'];
    type = json['type'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    hotel = json['hotel'] != null ? Hotel.fromJson(json['hotel']) : null;
  }

}

class User {
  int? id;
  String? name;
  String? email;
  String? apiToken;
  String? image;
  String? createdAt;
  String? updatedAt;


  User(
      {this.id,
        this.name,
        this.email,
        this.apiToken,
        this.image,
});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    apiToken = json['api_token'];
    image = json['image'];
  }


}

// class Hotel {
//   int? id;
//   String? name;
//   String? description;
//   String? price;
//   String? address;
//   String? longitude;
//   String? latitude;
//   String? rate;
//
//   List<HotelImages>? hotelImages;
//   List<Facilities>? facilities;
//
//   Hotel(
//       {this.id,
//         this.name,
//         this.description,
//         this.price,
//         this.address,
//         this.longitude,
//         this.latitude,
//         this.rate,
//         this.hotelImages,
//         this.facilities});
//
//   Hotel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     description = json['description'];
//     price = json['price'];
//     address = json['address'];
//     longitude = json['longitude'];
//     latitude = json['latitude'];
//     rate = json['rate'];
//     if (json['hotel_images'] != null) {
//       hotelImages = <HotelImages>[];
//       json['hotel_images'].forEach((v) {
//         hotelImages!.add(HotelImages.fromJson(v));
//       });
//     }
//     if (json['facilities'] != null) {
//       facilities = <Facilities>[];
//       json['facilities'].forEach((v) {
//         facilities!.add(Facilities.fromJson(v));
//       });
//     }
//   }
//
//
// }

class HotelImages {
  int? id;
  String? hotelId;
  String? image;


  HotelImages(
      {this.id, this.hotelId, this.image,});

  HotelImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hotelId = json['hotel_id'];
    image = json['image'];

  }


}

class Facilities {
  int? id;
  String? name;
  String? image;


  Facilities({this.id, this.name, this.image,});

  Facilities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];

  }


}

