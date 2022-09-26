import 'package:booking_hotel/core/network_service/network.dart';
import 'package:booking_hotel/data/models/hotel_data/hotel.dart';
import 'package:booking_hotel/data/remote/explore/explore_data_source.dart';
import 'package:booking_hotel/data/remote/hotels/hotels_data_source.dart';
import 'package:dartz/dartz.dart';

abstract class HotelsRepository {
  late NetworkService networkService;
  late HotelsDataSource hotelsDataSource;

  Future<Either<String, List<Hotel>>> getHotels({
    required int count,
    required int page,
    bool isEng = true,
  });
}
