import 'package:booking_hotel/data/models/hotel_data/data.dart';
import 'package:booking_hotel/data/models/hotel_data/status.dart';

class HotelData {
  Status? status;
  Data? data;

  HotelData({this.status, this.data});

  HotelData.fromJson(Map<String, dynamic> json) {
    status =
        json['status'] != null ? new Status.fromJson(json['status']) : null;
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
