import 'package:booking_hotel/core/exceptions/network_exception.dart';
import 'package:booking_hotel/core/exceptions/server_exception.dart';
import 'package:booking_hotel/core/network_service/network_service.dart';
import 'package:booking_hotel/data/models/booking_model.dart';
import 'package:booking_hotel/data/models/common_models/status_model.dart';
import 'package:booking_hotel/data/remote/booking/booking_data_source.dart';
import 'package:booking_hotel/data/repository/booking/repository_booking.dart';
import 'package:dartz/dartz.dart';

class RepositoryBookingImpl extends RepositoryBooking {
  final String Network_Connection_Error = "No internet connection!";

  late NetworkService networkService;

  @override
  late BookingDataSource bookingDataSource ;

  RepositoryBookingImpl({
    required this.networkService,
    required this.bookingDataSource ,
});

  @override
  Future<Either<String, BookingModel>> getBooking(String token, String type, int count, int page) async {
    try {
      final connected = await networkService.isConnected;
      if (!connected) {
        throw NetworkException(message: Network_Connection_Error);
      }
      final result = await bookingDataSource.getBooking(token, type, count, page);
      return Right(result);
    } on ServerException catch (e) {
      return Left(e.message);
    } on NetworkException catch (e) {
      return Left(e.message);
    }
  }

  @override
  Future<Either<String, StatusModel>> createBooking(String token, int hotelId) async {
    try {
      final connected = await networkService.isConnected;
      if (!connected) {
        throw NetworkException(message: Network_Connection_Error);
      }
      final result = await bookingDataSource.createBooking(token,hotelId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(e.message);
    } on NetworkException catch (e) {
      return Left(e.message);
    }
  }

  @override
  Future<Either<String, StatusModel>> updateBooking(String token, int bookingId, String type) async {
    try {
      final connected = await networkService.isConnected;
      if (!connected) {
        throw NetworkException(message: Network_Connection_Error);
      }
      final result = await bookingDataSource.updateBooking(token,bookingId,type);
      return Right(result);
    } on ServerException catch (e) {
      return Left(e.message);
    } on NetworkException catch (e) {
      return Left(e.message);
    }
  }
}
