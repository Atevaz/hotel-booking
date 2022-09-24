import 'package:booking_hotel/core/dio_service/dio_service.dart';
import 'package:booking_hotel/data/models/hotel_search_models_response/facility_model.dart';
import 'package:booking_hotel/data/models/hotel_search_models_response/hotel_model.dart';
import 'package:booking_hotel/data/models/hotel_search_param_model/search_hotel_params_model.dart';

abstract class RemoteExploreDataSource {
  late DioService dioService;

  Future<List<FacilityModel>> getFacilities();

  Future<List<HotelModel>> searchHotels({
    required SearchHotelParamsModel searchHotelParamsModel,
  });
}
