import 'package:booking_hotel/core/exceptions/network_exception.dart';
import 'package:booking_hotel/core/exceptions/server_exception.dart';
import 'package:booking_hotel/core/network_service/network_service.dart';
import 'package:booking_hotel/data/models/auth_response/auth_response_model.dart';
import 'package:booking_hotel/data/models/auth_response/user_model.dart';
import 'package:booking_hotel/data/remote/explore/explore_data_source.dart';
import 'package:booking_hotel/data/remote/profile/profile_data_source.dart';

import 'package:dartz/dartz.dart';

import 'profile_repository.dart';

class ProfileRepositoryImpl extends ProfileRepository {

  final String Network_Connection_Error = "No internet connection!";

  @override
  late NetworkService networkService;

  late ProfileDataSource profileDataSource ;

  ProfileRepositoryImpl({
    required this.networkService,
    required this.profileDataSource ,
  });

  @override
  Future<Either<String, AuthResponseModel>> changePassword(String password, String confirmedPassword, String email) async {
    try {
      final isConnected = await networkService.isConnected;
      if (!isConnected) {
        throw const NetworkException(message: "No Internet Connection!");
      }
      final result = await profileDataSource.changePassword(password, confirmedPassword, email);
      return Right(result);
    } on NetworkException catch (e) {
      return Left(e.message);
    } on ServerException catch (e) {
      return Left(e.message);
    } catch (e) {
      return Left("$e");
    }
  }

  @override
  Future<Either<String, AuthResponseModel>> getProfile(String token) async {
    try {
      final isConnected = await networkService.isConnected;
      if (!isConnected) {
        throw const NetworkException(message: "No Internet Connection!");
      }
      final result = await profileDataSource.getProfile(token);
      print('--------------- $result');
      return Right(result);
    } on NetworkException catch (e) {
      return Left(e.message);
    } on ServerException catch (e) {
      return Left(e.message);
    } catch (e) {
      return Left("$e");
    }
  }

  @override
  Future<Either<String, AuthResponseModel>> updateProfile() {
    // TODO: implement updateProfile
    throw UnimplementedError();
  }

}