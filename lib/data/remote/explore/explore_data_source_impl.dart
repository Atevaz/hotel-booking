import 'package:booking_hotel/core/constants/end_points.dart';
import 'package:booking_hotel/core/dio_service/dio_service.dart';
import 'package:booking_hotel/core/utils/dio_method.dart';
import 'package:booking_hotel/data/models/hotel_search_models_response/facility_model.dart';
import 'package:booking_hotel/data/models/hotel_search_models_response/facility_reponse_model.dart';
import 'package:booking_hotel/data/models/hotel_search_models_response/hotels_response_model.dart';
import 'package:booking_hotel/data/models/hotel_search_param_model/search_hotel_params_model.dart';

import 'explore_data_source.dart';

class RemoteExploreDataSourceImpl implements RemoteExploreDataSource {
  @override
  DioService dioService;

  RemoteExploreDataSourceImpl({required this.dioService});

  @override
  Future<List<FacilityModel>> getFacilities() async {
    final result = await serverRequest(
      call: () async => await dioService.get(
        endPoint: facilitiesGetEndPoint,
      ),
    );
    final model = FacilityResponseModel.fromMap(result);
    return model.facilities;
  }

  @override
  Future<HotelResponseModel> searchHotels({
    required SearchHotelParamsModel searchHotelParamsModel,
  }) async {
    final result = await serverRequest(
      call: () => dioService.get(
        endPoint: hotelsSearchEndPoint,
        query: searchHotelParamsModel.toMap(),
      ),
    );
    final model = HotelResponseModel.fromMap(result);
    return model;
  }
}
