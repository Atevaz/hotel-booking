import 'package:booking_hotel/data/models/hotel_data/data.dart';
import 'package:booking_hotel/data/models/hotel_data/status.dart';

class HotelData {
  Status? status;
  Data? data;

  HotelData({this.status, this.data});

  HotelData.fromJson(Map<String, dynamic> json) {
    status =
        json['status'] != null ? Status.fromJson(json['status']) : null;
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (status != null) {
      data['status'] = status!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
