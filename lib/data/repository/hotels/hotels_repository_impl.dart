import 'package:booking_hotel/core/constants/error_messages.dart';
import 'package:booking_hotel/core/exceptions/network_exception.dart';
import 'package:booking_hotel/core/exceptions/server_exception.dart';
import 'package:booking_hotel/core/network_service/network_service.dart';
import 'package:booking_hotel/data/models/hotel_data/hotel.dart';
import 'package:booking_hotel/data/remote/hotels/hotels_data_source.dart';
import 'package:booking_hotel/data/repository/hotels/hotels_repository.dart';

import 'package:dartz/dartz.dart';

class HotelsRepositoryImpl implements HotelsRepository {
  @override
  HotelsDataSource hotelsDataSource;

  @override
  NetworkService networkService;

  HotelsRepositoryImpl({
    required this.hotelsDataSource,
    required this.networkService,
  });

  @override
  Future<Either<String, List<Hotel>>> getHotels({
    required int count,
    required int page,
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
      final result = await hotelsDataSource.getHotels(count: count, page: page);
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
