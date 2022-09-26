import 'package:booking_hotel/core/constants/error_messages.dart';
import 'package:booking_hotel/core/exceptions/network_exception.dart';
import 'package:booking_hotel/core/exceptions/server_exception.dart';
import 'package:booking_hotel/core/network_service/network_service.dart';
import 'package:booking_hotel/data/models/hotel_search_models_response/facility_model.dart';
import 'package:booking_hotel/data/models/hotel_search_models_response/hotel_model.dart';
import 'package:booking_hotel/data/models/hotel_search_param_model/search_hotel_params_model.dart';
import 'package:booking_hotel/data/remote/explore/explore_data_source.dart';

import 'package:dartz/dartz.dart';

import 'explore_repository.dart';

class ExploreRepositoryImpl implements ExploreRepository {
  @override
  RemoteExploreDataSource exploreRemoteDataSource;

  @override
  NetworkService networkService;

  ExploreRepositoryImpl({
    required this.exploreRemoteDataSource,
    required this.networkService,
  });

  @override
  Future<Either<String, List<FacilityModel>>> getFacilities({
    bool isEng = true,
  }) async {
    try {
      final isConnected = await networkService.isConnected;
      if (!isConnected) {
        throw const NetworkException(
          arMessage: Network_Connection_Ar_Error,
          enMessage: Network_Connection_En_Error,
        );
      }
      final result = await exploreRemoteDataSource.getFacilities();
      return Right(result);
    } on NetworkException catch (e) {
      return Left(isEng ? e.enMessage : e.arMessage);
    } on ServerException catch (e) {
      return Left(isEng ? e.enMessage : e.arMessage);
    } catch (e) {
      return Left("$e");
    }
  }

  @override
  Future<Either<String, List<HotelModel>>> searchHotels({
    required SearchHotelParamsModel searchHotelParamsModel,
    bool isEng = true,
  }) async {
    try {
      final isConnected = await networkService.isConnected;
      if (!isConnected) {
        throw const NetworkException(
          arMessage: Network_Connection_Ar_Error,
          enMessage: Network_Connection_En_Error,
        );
      }
      final result = await exploreRemoteDataSource.searchHotels(
        searchHotelParamsModel: searchHotelParamsModel,
      );
      return Right(result);
    } on NetworkException catch (e) {
      return Left(isEng ? e.enMessage : e.arMessage);
    } on ServerException catch (e) {
      return Left(isEng ? e.enMessage : e.arMessage);
    } catch (e) {
      return Left("$e");
    }
  }
}
