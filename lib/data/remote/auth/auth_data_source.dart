import 'package:booking_hotel/core/dio_service/dio_service.dart';
import 'package:booking_hotel/data/models/auth_params/login_param_model.dart';
import 'package:booking_hotel/data/models/auth_params/register_param_model.dart';
import 'package:booking_hotel/data/models/auth_response/auth_response_model.dart';

abstract class RemoteAuthDataSource {
  late DioService dioService;

  Future<AuthResponseModel> login(LoginParamModel loginModel);

  Future<AuthResponseModel> getProfile(String token);

  Future<AuthResponseModel> register(RegisterParamModel registerModel);
}
