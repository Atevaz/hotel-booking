import 'package:booking_hotel/data/models/common_models/status_model.dart';
import 'package:booking_hotel/data/models/hotel_models_response/hotel_model.dart';

class HotelResponseModel {
  final StatusModel status;
  final int currentPage;
  final List<HotelModel>? hotels;
  final List<HotelModel>? bookings;
  final String firstPageUrl;
  final String? nextPageUrl;
  final String lastPageUrl;
  final String perPage;
  final int total;

  const HotelResponseModel({
    required this.status,
    required this.currentPage,
    required this.hotels,
    required this.bookings,
    required this.firstPageUrl,
    required this.nextPageUrl,
    required this.lastPageUrl,
    required this.perPage,
    required this.total,
  });
}
