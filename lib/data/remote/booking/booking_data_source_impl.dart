import 'package:booking_hotel/core/constants/end_points.dart';
import 'package:booking_hotel/core/dio_service/dio_service.dart';
import 'package:booking_hotel/core/utils/dio_method.dart';

import 'package:booking_hotel/data/model/common_models/status_model.dart';

import 'package:booking_hotel/data/model/param_models/booking_create_param_model.dart';

import 'package:booking_hotel/data/model/param_models/booking_fetch_param_model.dart';

import 'package:booking_hotel/data/model/param_models/booking_update_param_model.dart';

import 'package:booking_hotel/data/model/response_models/booking_response_model.dart';

import 'booking_data_source.dart';

class BookingDataSourceImpl implements BookingDataSource {
  @override
  DioService dioService;

  BookingDataSourceImpl({required this.dioService});

  @override
  Future<StatusModel> createBooking(
      BookingCreateParamModel bookingCreateParamModel) async {
    final result = await serverRequest(
      call: () async => await dioService.post(
        endPoint: bookingCreateEndPoint,
        token: bookingCreateParamModel.token,
        data: bookingCreateParamModel.toJson(),
      ),
    );
    final response = StatusModel.fromJson(result['status']);
    return response;
  }

  @override
  Future<BookingResponseModel> getBooking(
      BookingFetchParamModel bookingFetchParamModel) async {
    final result = await serverRequest(
      call: () async => await dioService.get(
        endPoint: bookingsGetEndPoint,
        token: bookingFetchParamModel.token,
        query: bookingFetchParamModel.toJson(),
      ),
    );
    final response = BookingResponseModel.fromJson(result);
    return response;
  }

  @override
  Future<StatusModel> updateBooking(
      BookingUpdateParamModel bookingUpdateParamModel) async {
    final result = await serverRequest(
      call: () async => await dioService.post(
        endPoint: bookingsUpdateEndPoint,
        token: bookingUpdateParamModel.token,
        data: bookingUpdateParamModel.toJson(),
      ),
    );
    final response = StatusModel.fromJson(result['status']);
    return response;
  }
}
