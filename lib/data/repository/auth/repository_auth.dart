import 'package:booking_hotel/core/network_service/network_service.dart';
import 'package:booking_hotel/data/local/auth/local_contract.dart';
import 'package:booking_hotel/data/models/auth_params/login_param_model.dart';
import 'package:booking_hotel/data/models/auth_params/register_param_model.dart';
import 'package:booking_hotel/data/models/auth_response/auth_response_model.dart';
import 'package:booking_hotel/data/remote/auth/auth_data_source.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  late LocalAuthContract localAuth;
  late RemoteAuthDataSource remoteAuth;
  late NetworkService networkService;

  Future<Either<String, AuthResponseModel>> loginSaved({
    bool isEng = true,
  });

  Future<Either<String, AuthResponseModel>> login(
    LoginParamModel loginParamModel,
    bool cacheUser, {
    bool isEng = true,
  });

  Future<Either<String, void>> logout({
    bool isEng = true,
  });

  Future<Either<String, AuthResponseModel>> register(
    RegisterParamModel registerParamModel, {
    bool isEng = true,
  });
}
