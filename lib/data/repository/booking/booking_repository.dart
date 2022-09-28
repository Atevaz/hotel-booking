import 'package:booking_hotel/core/network_service/network_service.dart';
import 'package:booking_hotel/data/model/common_models/status_model.dart';
import 'package:booking_hotel/data/model/param_models/booking_create_param_model.dart';
import 'package:booking_hotel/data/model/param_models/booking_fetch_param_model.dart';
import 'package:booking_hotel/data/model/param_models/booking_update_param_model.dart';
import 'package:booking_hotel/data/model/response_models/booking_response_model.dart';
import 'package:booking_hotel/data/remote/booking/booking_data_source.dart';
import 'package:dartz/dartz.dart';

abstract class BookingRepository {
  late NetworkService networkService;
  late BookingDataSource bookingDataSource;

  Future<Either<String, BookingResponseModel>> getBooking(
    BookingFetchParamModel bookingFetchParamModel, {
    bool isEng = true,
  });

  Future<Either<String, StatusModel>> createBooking(
    BookingCreateParamModel bookingCreateParamModel, {
    bool isEng = true,
  });

  Future<Either<String, StatusModel>> updateBooking(
    BookingUpdateParamModel bookingUpdateParamModel, {
    bool isEng = true,
  });
}
