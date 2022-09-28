import 'package:booking_hotel/core/dio_service/dio_service.dart';
import 'package:booking_hotel/data/model/param_models/change_pass_param_model.dart';
import 'package:booking_hotel/data/model/param_models/login_param_model.dart';
import 'package:booking_hotel/data/model/param_models/profile_update_param_model.dart';
import 'package:booking_hotel/data/model/param_models/register_param_model.dart';
import 'package:booking_hotel/data/model/response_models/auth_response_model.dart';

abstract class RemoteUserDataSource {
  late DioService dioService;

  Future<AuthResponseModel> login(LoginParamModel loginModel);

  Future<AuthResponseModel> getProfile(String token);

  Future<AuthResponseModel> register(RegisterParamModel registerModel);

  Future<AuthResponseModel> updateProfile(
    ProfileUpdateParamModel profileUpdateParamModel,
  );

  Future<AuthResponseModel> changePassword(
    ChangePasswordParamModel changePasswordParamModel,
  );
}
