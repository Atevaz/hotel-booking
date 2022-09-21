import 'dart:convert';

import 'package:booking_hotel/core/constants/shared_preferences_consts.dart';
import 'package:booking_hotel/core/exceptions/shared_preference_exception.dart';
import 'package:booking_hotel/core/shared_preferences/preferences_service.dart';
import 'package:booking_hotel/data/models/auth_params/login_param_model.dart';

import 'local_contract.dart';

class LocalAuthContractImpl implements LocalAuthContract {
  @override
  SharedPreferencesService preferencesService;

  LocalAuthContractImpl({
    required this.preferencesService,
  });

  @override
  Future<void> cacheUser({
    required String userData,
  }) async {
    try {
      final result = await preferencesService.saveString(
        key: Current_User_Key,
        value: userData,
      );
      if (!result) {
        throw const PreferenceException(message: Cache_User_Err);
      }
    } catch (e) {
      String message = "$e";
      if (e is PreferenceException) {
        message = e.message;
      }
      throw PreferenceException(message: message);
    }
  }

  @override
  Future<LoginParamModel> getUser() async {
    try {
      final result = await preferencesService.getString(
        key: Current_User_Key,
      );
      if (result == null) {
        throw const PreferenceException(
          message: Get_User_Err,
        );
      }
      final loginModel = LoginParamModel.fromJson(jsonDecode(result));
      return loginModel;
    } catch (e) {
      String message = "$e";
      if (e is PreferenceException) {
        message = e.message;
      }
      throw PreferenceException(message: message);
    }
  }

  @override
  Future<void> removeUser() async {
    try {
      final result = await preferencesService.removeString(
        key: Current_User_Key,
      );
      if (!result) {
        throw const PreferenceException(
          message: Remove_User_Err,
        );
      }
    } catch (e) {
      String message = "$e";
      if (e is PreferenceException) {
        message = e.message;
      }
      throw PreferenceException(message: message);
    }
  }
}
