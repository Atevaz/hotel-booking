import 'package:booking_hotel/core/dio_service/dio_service.dart';
import 'package:booking_hotel/data/models/hotel_data/hotel.dart';

abstract class HotelsDataSource {
  late DioService dioService;
  Future<List<Hotel>> getHotels({required int count, required int page});
}
