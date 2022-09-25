import 'package:booking_hotel/core/dio_service/dio.dart';
import 'package:booking_hotel/data/models/booking_model.dart';
import 'package:booking_hotel/data/models/common_models/status_model.dart';

abstract class BookingDataSource {
  late DioService dioService;

  Future<BookingModel> getBooking(
    String token,
    String type,
    int count,
    int page,
  );

  Future<StatusModel> createBooking(
    String token,
    int hotelId,
  );

  Future<StatusModel> updateBooking(
    String token,
    int bookingId,
    String type,
  );
}
