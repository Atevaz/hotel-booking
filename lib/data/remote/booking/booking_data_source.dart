import 'package:booking_hotel/core/dio_service/dio_service.dart';
import 'package:booking_hotel/data/model/common_models/status_model.dart';
import 'package:booking_hotel/data/model/param_models/booking_create_param_model.dart';
import 'package:booking_hotel/data/model/param_models/booking_fetch_param_model.dart';
import 'package:booking_hotel/data/model/param_models/booking_update_param_model.dart';
import 'package:booking_hotel/data/model/response_models/booking_response_model.dart';

abstract class BookingDataSource {
  late DioService dioService;

  Future<BookingResponseModel> getBooking(
    BookingFetchParamModel bookingFetchParamModel,
  );

  Future<StatusModel> createBooking(
    BookingCreateParamModel bookingCreateParamModel,
  );

  Future<StatusModel> updateBooking(
    BookingUpdateParamModel bookingUpdateParamModel,
  );
}
