// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:booking_hotel/core/constants/error_messages.dart';
import 'package:booking_hotel/core/exceptions/network_exception.dart';
import 'package:booking_hotel/core/exceptions/server_exception.dart';
import 'package:booking_hotel/core/exceptions/shared_preference_exception.dart';
import 'package:booking_hotel/core/network_service/network_service.dart';
import 'package:booking_hotel/data/local/auth/local_contract.dart';
import 'package:booking_hotel/data/models/auth_params/login_param_model.dart';
import 'package:booking_hotel/data/models/auth_params/register_param_model.dart';
import 'package:booking_hotel/data/models/auth_response/auth_response_model.dart';
import 'package:booking_hotel/data/remote/auth/auth_data_source.dart';
import 'package:dartz/dartz.dart';

import 'repository_auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  LocalAuthContract localAuth;

  @override
  RemoteAuthDataSource remoteAuth;

  @override
  NetworkService networkService;

  AuthRepositoryImpl({
    required this.localAuth,
    required this.remoteAuth,
    required this.networkService,
  });

  @override
  Future<Either<String, AuthResponseModel>> loginSaved({
    bool isEng = true,
  }) async {
    try {
      final connected = await networkService.isConnected;
      if (!connected) {
        throw const NetworkException(
          arMessage: Network_Connection_Ar_Error,
          enMessage: Network_Connection_En_Error,
        );
      }
      final loginModel = await localAuth.getUser();
      final result = await remoteAuth.login(loginModel);
      final profile = await remoteAuth.getProfile(result.user.token);
      result.user = profile.user;
      return Right(result);
    } on PreferenceException catch (e) {
      return Left(isEng ? e.enMessage : e.arMessage);
    } on ServerException catch (e) {
      return Left(isEng ? e.enMessage : e.arMessage);
    } on NetworkException catch (e) {
      return Left(isEng ? e.enMessage : e.arMessage);
    }
  }

  @override
  Future<Either<String, AuthResponseModel>> login(
    LoginParamModel loginParamModel,
    bool cacheUser, {
    bool isEng = true,
  }) async {
    try {
      final connected = await networkService.isConnected;
      if (!connected) {
        throw const NetworkException(
          arMessage: Network_Connection_Ar_Error,
          enMessage: Network_Connection_En_Error,
        );
      }
      final result = await remoteAuth.login(loginParamModel);
      if (cacheUser) {
        await localAuth.cacheUser(
          userData: jsonEncode(
            loginParamModel.toJson(),
          ),
        );
      }
      final profile = await remoteAuth.getProfile(result.user.token);
      result.user = profile.user;
      return Right(result);
    } on PreferenceException catch (e) {
      return Left(isEng ? e.enMessage : e.arMessage);
    } on ServerException catch (e) {
      return Left(isEng ? e.enMessage : e.arMessage);
    } on NetworkException catch (e) {
      return Left(isEng ? e.enMessage : e.arMessage);
    }
  }

  @override
  Future<Either<String, void>> logout({
    bool isEng = true,
  }) async {
    try {
      return Right(await localAuth.removeUser());
    } on PreferenceException catch (e) {
      return Left(isEng ? e.enMessage : e.arMessage);
    }
  }

  @override
  Future<Either<String, AuthResponseModel>> register(
    RegisterParamModel registerParamModel, {
    bool isEng = true,
  }) async {
    try {
      final connected = await networkService.isConnected;
      if (!connected) {
        throw const NetworkException(
          arMessage: Network_Connection_Ar_Error,
          enMessage: Network_Connection_En_Error,
        );
      }
      final result = await remoteAuth.register(registerParamModel);
      return Right(result);
    } on ServerException catch (e) {
      return Left(isEng ? e.enMessage : e.arMessage);
    } on NetworkException catch (e) {
      return Left(isEng ? e.enMessage : e.arMessage);
    }
  }
}
