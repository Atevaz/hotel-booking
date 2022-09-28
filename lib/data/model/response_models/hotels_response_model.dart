import 'package:booking_hotel/data/model/common_models/status_model.dart';
import 'package:booking_hotel/data/model/hotel_model.dart';

class HotelResponseModel {
  final StatusModel status;
  final int currentPage;
  final int lastPage;
  final List<HotelModel> hotels;
  final int perPage;
  final int total;

  const HotelResponseModel({
    required this.status,
    required this.currentPage,
    required this.hotels,
    required this.lastPage,
    required this.perPage,
    required this.total,
  });

  factory HotelResponseModel.fromJson(Map<String, dynamic> map) {
    final hotelStatus = StatusModel.fromJson(map['status']);
    final currentHotelsPage = map['data']['current_page'];
    final hotelList = HotelModel.fromJsonList(map['data']['data']);
    final lastHotelPage = map['data']['last_page'];
    final hotelsPerPage = int.parse(map['data']['per_page']);
    final totalHotels = map['data']['total'];
    return HotelResponseModel(
      status: hotelStatus,
      currentPage: currentHotelsPage,
      hotels: hotelList,
      lastPage: lastHotelPage,
      perPage: hotelsPerPage,
      total: totalHotels,
    );
  }
}
