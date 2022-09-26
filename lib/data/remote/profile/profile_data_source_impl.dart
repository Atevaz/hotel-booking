import 'package:booking_hotel/core/constants/constant.dart';
import 'package:booking_hotel/core/constants/end_points.dart';
import 'package:booking_hotel/core/dio_service/dio_service.dart';
import 'package:booking_hotel/core/utils/dio_method.dart';
import 'package:booking_hotel/data/models/auth_response/auth_response_model.dart';
import 'package:booking_hotel/data/models/auth_response/user_model.dart';
import 'package:booking_hotel/data/remote/profile/profile_data_source.dart';

class ProfileDataSourceImpl extends ProfileDataSource {
  DioService dioService;

  ProfileDataSourceImpl({required this.dioService});

  @override
  Future<AuthResponseModel> changePassword(
      String password, String confirmPassword, String email) async {
    final result = await serverRequest(
      call: () async => await dioService.post(
        endPoint: passwordUpdateEndPoint,
        token: token,
        data: {
          'password': password,
          'password_confirmation': confirmPassword,
          'email': email,
        },
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
  Future<AuthResponseModel> updateProfile(String token) {
    // TODO: implement updateProfile
    throw UnimplementedError();
  }
}
