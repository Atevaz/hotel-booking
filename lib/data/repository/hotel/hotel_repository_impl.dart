import 'package:booking_hotel/core/constants/error_messages.dart';
import 'package:booking_hotel/core/exceptions/network_exception.dart';
import 'package:booking_hotel/core/exceptions/server_exception.dart';
import 'package:booking_hotel/core/network_service/network_service.dart';

import 'package:booking_hotel/data/model/param_models/hotel_query_param_model.dart';

import 'package:booking_hotel/data/model/response_models/facility_response_model.dart';

import 'package:booking_hotel/data/model/response_models/hotels_response_model.dart';

import 'package:booking_hotel/data/remote/hotel/hotel_data_source.dart';

import 'package:dartz/dartz.dart';

import 'hotel_repository.dart';

class HotelRepositoryImpl implements HotelRepository {
  @override
  HotelDataSource hotelsDataSource;

  @override
  NetworkService networkService;

  HotelRepositoryImpl({
    required this.hotelsDataSource,
    required this.networkService,
  });

  @override
  Future<Either<String, FacilityResponseModel>> getFacilities(
      {bool isEng = true}) async {
    try {
      final isConnected = await networkService.isConnected;
      if (!isConnected) {
        throw const NetworkException(
          arMessage: Network_Connection_Ar_Error,
          enMessage: Network_Connection_En_Error,
        );
      }
      final result = await hotelsDataSource.getFacilities();
      return Right(result);
    } on NetworkException catch (e) {
      return Left(isEng ? e.enMessage : e.arMessage);
    } on ServerException catch (e) {
      return Left(isEng ? e.enMessage : e.arMessage);
    }
  }

  @override
  Future<Either<String, HotelResponseModel>> getHotels(
      {required HotelQueryParamsModel hotelQueryParamsModel,
      bool isEng = true}) async {
    try {
      final isConnected = await networkService.isConnected;
      if (!isConnected) {
        throw const NetworkException(
          arMessage: Network_Connection_Ar_Error,
          enMessage: Network_Connection_En_Error,
        );
      }
      final result = await hotelsDataSource.getHotels(hotelQueryParamsModel);
      return Right(result);
    } on NetworkException catch (e) {
      return Left(isEng ? e.enMessage : e.arMessage);
    } on ServerException catch (e) {
      return Left(isEng ? e.enMessage : e.arMessage);
    }
  }

  @override
  Future<Either<String, HotelResponseModel>> searchHotels(
      {required HotelQueryParamsModel hotelQueryParamsModel,
      bool isEng = true}) async {
    try {
      final isConnected = await networkService.isConnected;
      if (!isConnected) {
        throw const NetworkException(
          arMessage: Network_Connection_Ar_Error,
          enMessage: Network_Connection_En_Error,
        );
      }
      final result = await hotelsDataSource.searchHotels(
        hotelQueryParamsModel,
      );
      return Right(result);
    } on NetworkException catch (e) {
      return Left(isEng ? e.enMessage : e.arMessage);
    } on ServerException catch (e) {
      return Left(isEng ? e.enMessage : e.arMessage);
    }
  }
}
