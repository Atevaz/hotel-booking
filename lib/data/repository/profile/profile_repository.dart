import 'package:booking_hotel/core/network_service/network_service.dart';
import 'package:booking_hotel/data/models/auth_response/auth_response_model.dart';
import 'package:booking_hotel/data/models/auth_response/user_model.dart';
import 'package:booking_hotel/data/remote/explore/explore_data_source.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepository {
  late NetworkService networkService;
  late RemoteExploreDataSource exploreRemoteDataSource;

  Future<Either<String, AuthResponseModel>> getProfile(String token);
  Future<Either<String, AuthResponseModel>> changePassword(String password,String confirmedPassword,String email);
  Future<Either<String, AuthResponseModel>> updateProfile();

}
