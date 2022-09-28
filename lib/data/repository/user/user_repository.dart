import 'package:booking_hotel/core/network_service/network_service.dart';
import 'package:booking_hotel/data/local/user/local_user_data_source.dart';
import 'package:booking_hotel/data/model/param_models/change_pass_param_model.dart';
import 'package:booking_hotel/data/model/param_models/login_param_model.dart';
import 'package:booking_hotel/data/model/param_models/profile_update_param_model.dart';
import 'package:booking_hotel/data/model/param_models/register_param_model.dart';
import 'package:booking_hotel/data/model/response_models/auth_response_model.dart';
import 'package:booking_hotel/data/remote/user/remote_user_data_source.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  late LocalUserDataSource localUserDataSource;
  late RemoteUserDataSource userDataSource;
  late NetworkService networkService;

  Future<Either<String, AuthResponseModel?>> loginSaved({
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

  Future<Either<String, AuthResponseModel>> getProfile(
    String token, {
    bool isEng = true,
  });

  Future<Either<String, AuthResponseModel>> changePassword(
    ChangePasswordParamModel changePasswordParamModel, {
    bool isEng = true,
  });

  Future<Either<String, AuthResponseModel>> updateProfile(
    ProfileUpdateParamModel profileUpdateParamModel, {
    bool isEng = true,
  });

  Future<Either<String, void>> updateCachedUser({
    String? password,
    String? email,
    bool isEng = true,
  });
}
