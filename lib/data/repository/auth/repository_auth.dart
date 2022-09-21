import 'package:booking_hotel/core/network_service/network_service.dart';
import 'package:booking_hotel/data/local/auth/local_contract.dart';
import 'package:booking_hotel/data/models/auth_params/login_param_model.dart';
import 'package:booking_hotel/data/models/auth_params/register_param_model.dart';
import 'package:booking_hotel/data/models/auth_response/auth_response_model.dart';
import 'package:booking_hotel/data/remote/auth/remote_contract.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  late LocalAuthContract localAuth;
  late RemoteAuthContract remoteAuth;
  late NetworkService networkService;

  Future<Either<String, AuthResponseModel>> login(
    LoginParamModel? loginParamModel, [
    bool cacheUser = false,
  ]);

  Future<Either<String, void>> logout();

  Future<Either<String, AuthResponseModel>> register(
    RegisterParamModel registerParamModel,
  );
}
