import 'package:booking_hotel/core/dio_service/dio_service.dart';
import 'package:booking_hotel/data/models/auth_response/auth_response_model.dart';
import 'package:booking_hotel/data/models/auth_response/user_model.dart';

abstract class ProfileDataSource {

  late DioService dioService ;

  Future<AuthResponseModel> getProfile(String token );
  Future<AuthResponseModel> updateProfile(String token , );
  Future<AuthResponseModel> changePassword(String password , String confirmPassword,String email);

}