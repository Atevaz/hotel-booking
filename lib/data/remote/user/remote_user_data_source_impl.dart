import 'package:booking_hotel/core/constants/end_points.dart';
import 'package:booking_hotel/core/dio_service/dio_service.dart';
import 'package:booking_hotel/core/utils/dio_method.dart';

import 'package:booking_hotel/data/model/param_models/change_pass_param_model.dart';

import 'package:booking_hotel/data/model/param_models/login_param_model.dart';

import 'package:booking_hotel/data/model/param_models/profile_update_param_model.dart';

import 'package:booking_hotel/data/model/param_models/register_param_model.dart';

import 'package:booking_hotel/data/model/response_models/auth_response_model.dart';
import 'package:dio/dio.dart';

import 'remote_user_data_source.dart';

class RemoteUserDataSourceImpl implements RemoteUserDataSource {
  @override
  DioService dioService;

  RemoteUserDataSourceImpl({
    required this.dioService,
  });

  @override
  Future<AuthResponseModel> changePassword(
      ChangePasswordParamModel changePasswordParamModel) async {
    final result = await serverRequest(
      call: () async => await dioService.post(
        endPoint: passwordUpdateEndPoint,
        token: changePasswordParamModel.token,
        data: changePasswordParamModel.toJson(),
      ),
    );
    final response = AuthResponseModel.fromMap(result);
    return response;
  }

  @override
  Future<AuthResponseModel> getProfile(String token) async {
    final result = await serverRequest(
      call: () async => await dioService.get(
        endPoint: profileGetEndPoint,
        token: token,
      ),
    );
    final response = AuthResponseModel.fromMap(result);
    return response;
  }

  @override
  Future<AuthResponseModel> login(LoginParamModel loginModel) async {
    final result = await serverRequest(
      call: () async => await dioService.post(
        endPoint: loginEndPoint,
        data: loginModel.toJson(),
      ),
    );
    final response = AuthResponseModel.fromMap(result);
    return response;
  }

  @override
  Future<AuthResponseModel> register(RegisterParamModel registerModel) async {
    final result = await serverRequest(
      call: () async => await dioService.post(
        endPoint: registerEndPoint,
        data: registerModel.toJson(),
      ),
    );
    final response = AuthResponseModel.fromMap(result);
    return response;
  }

  @override
  Future<AuthResponseModel> updateProfile(
      ProfileUpdateParamModel profileUpdateParamModel) async {
    final result = await serverRequest(
      call: () async => await dioService.post(
        isMultipart: profileUpdateParamModel.image != null ? true : false,
        endPoint: profileUpdateEndPoint,
        token: profileUpdateParamModel.token,
        data: profileUpdateParamModel.image != null
            ? FormData.fromMap(profileUpdateParamModel.toJson())
            : profileUpdateParamModel.toJson(),
      ),
    );
    final response = AuthResponseModel.fromMap(result);
    return response;
  }
}
