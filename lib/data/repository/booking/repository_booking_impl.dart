import 'package:booking_hotel/core/constants/error_messages.dart';
import 'package:booking_hotel/core/exceptions/network_exception.dart';
import 'package:booking_hotel/core/exceptions/server_exception.dart';
import 'package:booking_hotel/core/network_service/network_service.dart';
import 'package:booking_hotel/data/models/booking_model.dart';
import 'package:booking_hotel/data/models/common_models/status_model.dart';
import 'package:booking_hotel/data/remote/booking/booking_data_source.dart';
import 'package:booking_hotel/data/repository/booking/repository_booking.dart';
import 'package:dartz/dartz.dart';

class RepositoryBookingImpl implements RepositoryBooking {
  late NetworkService networkService;

  @override
  BookingDataSource bookingDataSource;

  RepositoryBookingImpl({
    required this.networkService,
    required this.bookingDataSource,
  });

  @override
  Future<Either<String, BookingModel>> getBooking(
    String token,
    String type,
    int count,
    int page, {
    bool isEng = true,
  }) async {
    try {
      final connected = await networkService.isConnected;
      if (!connected) {
        throw const NetworkException(
          arMessage: Network_Connection_Ar_Error,
          enMessage: Network_Connection_En_Error,
        );
      }
      final result =
          await bookingDataSource.getBooking(token, type, count, page);
      return Right(result);
    } on ServerException catch (e) {
      return Left(isEng ? e.enMessage : e.arMessage);
    } on NetworkException catch (e) {
      return Left(isEng ? e.enMessage : e.arMessage);
    }
  }

  @override
  Future<Either<String, StatusModel>> createBooking(
    String token,
    int hotelId, {
    bool isEng = true,
  }) async {
    try {
      final connected = await networkService.isConnected;
      if (!connected) {
        throw const NetworkException(
          arMessage: Network_Connection_Ar_Error,
          enMessage: Network_Connection_En_Error,
        );
      }
      final result = await bookingDataSource.createBooking(token, hotelId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(isEng ? e.enMessage : e.arMessage);
    } on NetworkException catch (e) {
      return Left(isEng ? e.enMessage : e.arMessage);
    }
  }

  @override
  Future<Either<String, StatusModel>> updateBooking(
    String token,
    int bookingId,
    String type, {
    bool isEng = true,
  }) async {
    try {
      final connected = await networkService.isConnected;
      if (!connected) {
        throw const NetworkException(
          arMessage: Network_Connection_Ar_Error,
          enMessage: Network_Connection_En_Error,
        );
      }
      final result =
          await bookingDataSource.updateBooking(token, bookingId, type);
      return Right(result);
    } on ServerException catch (e) {
      return Left(isEng ? e.enMessage : e.arMessage);
    } on NetworkException catch (e) {
      return Left(isEng ? e.enMessage : e.arMessage);
    }
  }
}
