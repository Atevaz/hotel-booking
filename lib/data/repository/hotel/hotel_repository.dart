import 'package:booking_hotel/core/network_service/network_service.dart';
import 'package:booking_hotel/data/model/param_models/hotel_query_param_model.dart';
import 'package:booking_hotel/data/model/response_models/facility_response_model.dart';
import 'package:booking_hotel/data/model/response_models/hotels_response_model.dart';
import 'package:booking_hotel/data/remote/hotel/hotel_data_source.dart';
import 'package:dartz/dartz.dart';

abstract class HotelRepository {
  late NetworkService networkService;
  late HotelDataSource hotelsDataSource;

  Future<Either<String, FacilityResponseModel>> getFacilities({
    bool isEng = true,
  });

  Future<Either<String, HotelResponseModel>> searchHotels({
    required HotelQueryParamsModel hotelQueryParamsModel,
    bool isEng = true,
  });

  Future<Either<String, HotelResponseModel>> getHotels({
    required HotelQueryParamsModel hotelQueryParamsModel,
    bool isEng = true,
  });
}
