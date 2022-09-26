import 'package:booking_hotel/core/dio_service/dio_service.dart';
import 'package:booking_hotel/data/models/auth_response/auth_response_model.dart';
import 'package:booking_hotel/data/models/auth_response/user_model.dart';
import 'package:dio/dio.dart';

abstract class ProfileDataSource {

  late DioService dioService ;

  Future<AuthResponseModel> getProfile(String token );
  Future<AuthResponseModel> updateProfile(String name,String email,MultipartFile? image);
  Future<AuthResponseModel> changePassword(String password , String confirmPassword,String email);

}