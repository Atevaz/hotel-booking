import 'package:booking_hotel/core/constants/end_points.dart';
import 'package:booking_hotel/core/dio_service/dio.dart';
import 'package:booking_hotel/core/utils/dio_method.dart';
import 'package:booking_hotel/data/models/auth_response/user_model.dart';
import 'package:dartz/dartz.dart';

class TestApi {
  DioService dioService;

  TestApi(this.dioService);

  Future<Either<String, UserModel>> getHotels() async {
    try {
      final result = await serverRequest(
        call: () async => await dioService.get(
          endPoint: hotelsEndPoint,
          data: null,
          token: null,
        ),
      );
      final model = UserModel.fromMap(result);
      return Right(model);
    } catch (e) {
      return Left("$e");
    }
  }
}
