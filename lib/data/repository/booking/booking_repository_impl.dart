import 'package:booking_hotel/core/constants/error_messages.dart';
import 'package:booking_hotel/core/exceptions/network_exception.dart';
import 'package:booking_hotel/core/exceptions/server_exception.dart';
import 'package:booking_hotel/core/network_service/network_service.dart';

import 'package:booking_hotel/data/model/common_models/status_model.dart';

import 'package:booking_hotel/data/model/param_models/booking_create_param_model.dart';

import 'package:booking_hotel/data/model/param_models/booking_fetch_param_model.dart';

import 'package:booking_hotel/data/model/param_models/booking_update_param_model.dart';

import 'package:booking_hotel/data/model/response_models/booking_response_model.dart';

import 'package:booking_hotel/data/remote/booking/booking_data_source.dart';

import 'package:dartz/dartz.dart';

import 'booking_repository.dart';

class BookingRepositoryImpl implements BookingRepository {
  @override
  BookingDataSource bookingDataSource;

  @override
  NetworkService networkService;

  BookingRepositoryImpl({
    required this.bookingDataSource,
    required this.networkService,
  });

  @override
  Future<Either<String, StatusModel>> createBooking(
      BookingCreateParamModel bookingCreateParamModel,
      {bool isEng = true}) async {
    try {
      final connected = await networkService.isConnected;
      if (!connected) {
        throw const NetworkException(
          arMessage: Network_Connection_Ar_Error,
          enMessage: Network_Connection_En_Error,
        );
      }
      final result =
          await bookingDataSource.createBooking(bookingCreateParamModel);
      return Right(result);
    } on ServerException catch (e) {
      return Left(isEng ? e.enMessage : e.arMessage);
    } on NetworkException catch (e) {
      return Left(isEng ? e.enMessage : e.arMessage);
    }
  }

  @override
  Future<Either<String, BookingResponseModel>> getBooking(
      BookingFetchParamModel bookingFetchParamModel,
      {bool isEng = true}) async {
    try {
      final connected = await networkService.isConnected;
      if (!connected) {
        throw const NetworkException(
          arMessage: Network_Connection_Ar_Error,
          enMessage: Network_Connection_En_Error,
        );
      }
      final result = await bookingDataSource.getBooking(bookingFetchParamModel);
      return Right(result);
    } on ServerException catch (e) {
      return Left(isEng ? e.enMessage : e.arMessage);
    } on NetworkException catch (e) {
      return Left(isEng ? e.enMessage : e.arMessage);
    }
  }

  @override
  Future<Either<String, StatusModel>> updateBooking(
      BookingUpdateParamModel bookingUpdateParamModel,
      {bool isEng = true}) async {
    try {
      final connected = await networkService.isConnected;
      if (!connected) {
        throw const NetworkException(
          arMessage: Network_Connection_Ar_Error,
          enMessage: Network_Connection_En_Error,
        );
      }
      final result =
          await bookingDataSource.updateBooking(bookingUpdateParamModel);
      return Right(result);
    } on ServerException catch (e) {
      return Left(isEng ? e.enMessage : e.arMessage);
    } on NetworkException catch (e) {
      return Left(isEng ? e.enMessage : e.arMessage);
    }
  }
}
