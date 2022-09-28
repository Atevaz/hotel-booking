import 'package:booking_hotel/data/model/booking_model.dart';
import 'package:booking_hotel/data/model/common_models/status_model.dart';

class BookingResponseModel {
  final StatusModel status;
  final int currentPage;
  final int lastPage;
  final List<BookingModel> bookings;
  final int perPage;
  final int total;

  const BookingResponseModel({
    required this.status,
    required this.currentPage,
    required this.lastPage,
    required this.bookings,
    required this.perPage,
    required this.total,
  });

  factory BookingResponseModel.fromJson(Map<String, dynamic> map) {
    final bookingStatus = StatusModel.fromJson(map['status']);
    final currentBookingPage = map['data']['current_page'];
    final lastBookingPage = map['data']['last_page'];
    final bookingList = BookingModel.fromJsonList(
      map['data']['data'],
    );
    final bookingPerPage = int.parse(map['data']['per_page']);
    final totalBookings = map['data']['total'];
    return BookingResponseModel(
      status: bookingStatus,
      currentPage: currentBookingPage,
      lastPage: lastBookingPage,
      bookings: bookingList,
      perPage: bookingPerPage,
      total: totalBookings,
    );
  }
}
