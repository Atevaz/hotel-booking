import 'package:booking_hotel/core/constants/error_messages.dart';
import 'package:booking_hotel/core/exceptions/network_exception.dart';
import 'package:booking_hotel/core/exceptions/server_exception.dart';
import 'package:booking_hotel/core/network_service/network_service.dart';
import 'package:booking_hotel/data/models/auth_response/auth_response_model.dart';
import 'package:booking_hotel/data/remote/profile/profile_data_source.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import 'profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  @override
  NetworkService networkService;

  @override
  ProfileDataSource profileDataSource;

  ProfileRepositoryImpl({
    required this.networkService,
    required this.profileDataSource,
  });

  @override
  Future<Either<String, AuthResponseModel>> changePassword(
    String password,
    String confirmedPassword,
    String email, {
    bool isEng = true,
  }) async {
    try {
      final isConnected = await networkService.isConnected;
      if (!isConnected) {
        throw const NetworkException(
          arMessage: Network_Connection_Ar_Error,
          enMessage: Network_Connection_En_Error,
        );
      }
      final result = await profileDataSource.changePassword(
          password, confirmedPassword, email);
      return Right(result);
    } on NetworkException catch (e) {
      return Left(isEng ? e.enMessage : e.arMessage);
    } on ServerException catch (e) {
      return Left(isEng ? e.enMessage : e.arMessage);
    } catch (e) {
      return Left("$e");
    }
  }

  @override
  Future<Either<String, AuthResponseModel>> getProfile(
    String token, {
    bool isEng = true,
  }) async {
    try {
      final isConnected = await networkService.isConnected;
      if (!isConnected) {
        throw const NetworkException(
          arMessage: Network_Connection_Ar_Error,
          enMessage: Network_Connection_En_Error,
        );
      }
      final result = await profileDataSource.getProfile(token);
      debugPrint('--------------- $result');
      return Right(result);
    } on NetworkException catch (e) {
      return Left(isEng ? e.enMessage : e.arMessage);
    } on ServerException catch (e) {
      return Left(isEng ? e.enMessage : e.arMessage);
    } catch (e) {
      return Left("$e");
    }
  }

  @override
  Future<Either<String, AuthResponseModel>> updateProfile({
    bool isEng = true,
  }) {
    // TODO: implement updateProfile
    throw UnimplementedError();
  }
}
