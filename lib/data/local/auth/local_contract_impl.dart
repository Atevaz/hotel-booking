import 'dart:convert';

import 'package:booking_hotel/core/constants/error_messages.dart';
import 'package:booking_hotel/core/constants/shared_preferences_consts.dart';
import 'package:booking_hotel/core/exceptions/shared_preference_exception.dart';
import 'package:booking_hotel/core/shared_preferences/preference_helper.dart';
import 'package:booking_hotel/data/models/auth_params/login_param_model.dart';

import 'local_contract.dart';

class LocalAuthContractImpl implements LocalAuthContract {
  @override
  PreferenceHelper cacheHelper;

  LocalAuthContractImpl({
    required this.cacheHelper,
  });

  @override
  Future<void> cacheUser({
    required String userData,
  }) async {
    try {
      final result = await cacheHelper.saveDataSharedPreference(
        key: Current_User_Key,
        value: userData,
      );
      if (!result) {
        throw const PreferenceException(
          enMessage: Cache_User_En_Err,
          arMessage: Cache_User_Ar_Err,
        );
      }
    } catch (e) {
      String arMessage = "$e";
      String enMessage = "$e";
      if (e is PreferenceException) {
        arMessage = e.arMessage;
        enMessage = e.enMessage;
      }
      throw PreferenceException(
        arMessage: arMessage,
        enMessage: enMessage,
      );
    }
  }

  @override
  Future<LoginParamModel> getUser() async {
    try {
      final result = await cacheHelper.getString(
        key: Current_User_Key,
      );
      if (result == null) {
        throw const PreferenceException(
          arMessage: Get_User_Ar_Err,
          enMessage: Get_User_En_Err,
        );
      }
      final loginModel = LoginParamModel.fromJson(jsonDecode(result));
      return loginModel;
    } catch (e) {
      String arMessage = "$e";
      String enMessage = "$e";
      if (e is PreferenceException) {
        arMessage = e.arMessage;
        enMessage = e.enMessage;
      }
      throw PreferenceException(
        arMessage: arMessage,
        enMessage: enMessage,
      );
    }
  }

  @override
  Future<void> removeUser() async {
    try {
      final result = await cacheHelper.removeData(
        key: Current_User_Key,
      );
      if (!result) {
        throw const PreferenceException(
            arMessage: Remove_User_Ar_Err, enMessage: Remove_User_En_Err);
      }
    } catch (e) {
      String arMessage = "$e";
      String enMessage = "$e";
      if (e is PreferenceException) {
        arMessage = e.arMessage;
        enMessage = e.enMessage;
      }
      throw PreferenceException(
        arMessage: arMessage,
        enMessage: enMessage,
      );
    }
  }
}
