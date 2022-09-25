import 'package:booking_hotel/core/constants/end_points.dart';
import 'package:booking_hotel/core/dio_service/dio_service.dart';
import 'package:booking_hotel/core/utils/dio_method.dart';
import 'package:booking_hotel/data/models/booking_model.dart';
import 'package:booking_hotel/data/models/common_models/status_model.dart';
import 'package:booking_hotel/data/remote/booking/booking_data_source.dart';

class BookingDataSourceImpl implements BookingDataSource {
  @override
  DioService dioService;

  BookingDataSourceImpl({required this.dioService});

  @override
  Future<BookingModel> getBooking(
    String token,
    String type,
    int count,
    int page,
  ) async {
    final result = await serverRequest(
      call: () async => await dioService.get(
        endPoint: bookingsGetEndPoint,
        token: token,
        query: {
          'type': type,
          'count': count,
          'page': page,
        },
      ),
    );
    final response = BookingModel.fromJson(result);
    return response;
  }

  @override
  Future<StatusModel> createBooking(String token, int hotelId) async {
    final result = await serverRequest(
      call: () async => await dioService.post(
        endPoint: bookingCreateEndPoint,
        token: token,
        data: {
          'hotel_id': hotelId,
        },
      ),
    );
    final response = StatusModel.fromJson(result);
    return response;
  }

  @override
  Future<StatusModel> updateBooking(
      String token, int bookingId, String type) async {
    final result = await serverRequest(
      call: () async => await dioService.post(
        endPoint: bookingsUpdateEndPoint,
        token: token,
        data: {'booking_id': bookingId, 'type': type},
      ),
    );
    final response = StatusModel.fromJson(result);
    return response;
  }
}
