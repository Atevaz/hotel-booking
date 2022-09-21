import 'package:booking_hotel/core/constants/end_points.dart';
import 'package:booking_hotel/core/dio_service/dio_service.dart';

import 'package:booking_hotel/core/utils/dio_method.dart';
import 'package:booking_hotel/data/models/auth_params/login_param_model.dart';
import 'package:booking_hotel/data/models/auth_params/register_param_model.dart';
import 'package:booking_hotel/data/models/auth_response/auth_response_model.dart';

import 'remote_contract.dart';

class RemoteAuthContractImpl implements RemoteAuthContract {
  @override
  DioService dioService;

  RemoteAuthContractImpl({
    required this.dioService,
  });

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
        data: registerModel.toMap(),
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
}
