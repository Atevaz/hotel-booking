import 'package:booking_hotel/core/dio_service/dio_service.dart';
import 'package:booking_hotel/data/model/param_models/hotel_query_param_model.dart';
import 'package:booking_hotel/data/model/response_models/facility_response_model.dart';
import 'package:booking_hotel/data/model/response_models/hotels_response_model.dart';

abstract class HotelDataSource {
  late DioService dioService;

  Future<HotelResponseModel> getHotels(
    HotelQueryParamsModel hotelQueryParamsModel,
  );

  Future<FacilityResponseModel> getFacilities();

  Future<HotelResponseModel> searchHotels(
    HotelQueryParamsModel hotelQueryParamsModel,
  );
}
