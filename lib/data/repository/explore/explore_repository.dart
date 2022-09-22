import 'package:booking_hotel/core/network_service/network.dart';
import 'package:booking_hotel/data/models/hotel_search_models_response/facility_model.dart';
import 'package:booking_hotel/data/models/hotel_search_models_response/hotel_model.dart';
import 'package:booking_hotel/data/models/hotel_search_param_model/search_hotel_params_model.dart';
import 'package:booking_hotel/data/remote/explore/explore_data_source.dart';
import 'package:dartz/dartz.dart';

abstract class ExploreRepository {
  late NetworkService networkService;
  late RemoteExploreDataSource exploreRemoteDataSource;

  Future<Either<String, List<FacilityModel>>> getFacilities();

  Future<Either<String, List<HotelModel>>> searchHotels({
    required SearchHotelParamsModel searchHotelParamsModel,
  });
}
