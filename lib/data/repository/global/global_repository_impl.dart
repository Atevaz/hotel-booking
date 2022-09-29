import 'package:booking_hotel/core/constants/error_messages.dart';
import 'package:booking_hotel/core/constants/shared_preferences_consts.dart';
import 'package:booking_hotel/core/exceptions/shared_preference_exception.dart';
import 'package:booking_hotel/core/shared_preferences/preference_helper.dart';
import 'package:dartz/dartz.dart';

import 'package:flutter/material.dart';

import 'global_repository.dart';

class GlobalRepositoryImpl implements GlobalRepository {
  @override
  PreferenceHelper helper;

  GlobalRepositoryImpl({
    required this.helper,
  });

  @override
  Future<Locale?> appLang() async {
    try {
      Locale? result;
      String? lang = await helper.getString(key: Current_Language_Key);
      if (lang != null) {
        result =
            lang == 'en' ? const Locale('en', 'US') : const Locale('ar', 'EG');
      }
      return result;
    } catch (e) {
      debugPrint('$e');
      return null;
    }
  }

  @override
  Future<bool?> isDarkMode() async {
    try {
      bool? isDark = await helper.getBool(key: Current_Theme_Mode_Key);
      return isDark;
    } catch (e) {
      debugPrint('$e');
      return null;
    }
  }

  @override
  Future<Either<String, bool>> saveLang({
    required String locale,
    bool isEng = true,
  }) async {
    try {
      final result = await helper.saveDataSharedPreference(
        key: Current_Language_Key,
        value: locale,
      );
      if (!result) {
        throw const PreferenceException(
          enMessage: Cache_Locale_En_Error,
          arMessage: Cache_Locale_Ar_Error,
        );
      }
      return Right(result);
    } on PreferenceException catch (e) {
      return Left(isEng ? e.enMessage : e.arMessage);
    }
  }

  @override
  Future<Either<String, bool>> saveMode({
    required bool isDark,
    bool isEng = true,
  }) async {
    try {
      final result = await helper.saveDataSharedPreference(
        key: Current_Theme_Mode_Key,
        value: isDark,
      );
      if (!result) {
        throw const PreferenceException(
          enMessage: Cache_ThemeMode_En_Error,
          arMessage: Cache_ThemeMode_Ar_Error,
        );
      }
      return Right(result);
    } on PreferenceException catch (e) {
      return Left(isEng ? e.enMessage : e.arMessage);
    }
  }

  @override
  Future<bool> appFirstUse() async {
    try {
      bool? firstUser = await helper.getBool(key: App_First_User_Key);
      if (firstUser == null) {
        await helper.saveDataSharedPreference(
          key: App_First_User_Key,
          value: false,
        );
        firstUser = true;
      }
      return firstUser;
    } catch (e) {
      return true;
    }
  }
}
