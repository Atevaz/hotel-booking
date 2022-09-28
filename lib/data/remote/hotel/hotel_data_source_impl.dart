import 'package:booking_hotel/core/constants/end_points.dart';
import 'package:booking_hotel/core/dio_service/dio_service.dart';
import 'package:booking_hotel/core/utils/dio_method.dart';

import 'package:booking_hotel/data/model/param_models/hotel_query_param_model.dart';

import 'package:booking_hotel/data/model/response_models/facility_response_model.dart';

import 'package:booking_hotel/data/model/response_models/hotels_response_model.dart';

import 'hotel_data_source.dart';

class HotelDataSourceImpl implements HotelDataSource {
  @override
  DioService dioService;

  HotelDataSourceImpl({required this.dioService});

  @override
  Future<FacilityResponseModel> getFacilities() async {
    final result = await serverRequest(
      call: () async => await dioService.get(
        endPoint: facilitiesGetEndPoint,
      ),
    );
    final response = FacilityResponseModel.fromJson(result);
    return response;
  }

  @override
  Future<HotelResponseModel> getHotels(
      HotelQueryParamsModel hotelQueryParamsModel) async {
    final result = await serverRequest(
      call: () async => await dioService.get(
        endPoint: hotelsEndPoint,
        query: hotelQueryParamsModel.toJson(),
      ),
    );
    final response = HotelResponseModel.fromJson(result);
    return response;
  }

  @override
  Future<HotelResponseModel> searchHotels(
      HotelQueryParamsModel hotelQueryParamsModel) async {
    final result = await serverRequest(
      call: () async => await dioService.get(
        endPoint: hotelsSearchEndPoint,
        query: hotelQueryParamsModel.toJson(),
      ),
    );
    final response = HotelResponseModel.fromJson(result);
    return response;
  }
}
