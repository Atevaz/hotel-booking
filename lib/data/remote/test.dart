import 'package:booking_hotel/core/constants/end_points.dart';
import 'package:booking_hotel/core/dio_service/dio.dart';
import 'package:booking_hotel/core/exceptions/network_exception.dart';
import 'package:booking_hotel/core/exceptions/server_exception.dart';
import 'package:booking_hotel/core/network_service/network.dart';
import 'package:booking_hotel/core/utils/dio_method.dart';
import 'package:booking_hotel/data/models/auth_response/user_model.dart';
import 'package:dartz/dartz.dart';

class TestApi {
  NetworkService networkService;
  DioService dioService;

  TestApi(
    this.dioService,
    this.networkService,
  );

  Future<Either<String, UserModel>> getHotels() async {
    try {
      if (!(await networkService.isConnected)) {
        throw const NetworkException(message: "No internet connection!");
      }
      final result = await serverRequest(
        call: () async => await dioService.get(
          endPoint: hotelsEndPoint,
          data: null,
          token: null,
        ),
      );
      final model = UserModel.fromMap(result);
      return Right(model);
    } on NetworkException catch (e) {
      return Left(e.message);
    } on ServerException catch (e) {
      return Left(e.message);
    } catch (e) {
      return Left("$e");
    }
  }
}
