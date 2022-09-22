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
  Future<Locale> appLang() async {
    Locale result = const Locale("en");
    try {
      String? lang = await helper.getString(key: Current_Language_Key);
      if (lang != null) {
        result = Locale(lang);
      }
      return result;
    } catch (e) {
      debugPrint('$e');
      return result;
    }
  }

  @override
  Future<bool> isDarkMode() async {
    bool result = false;
    try {
      bool? isDark = await helper.getBool(key: Current_Theme_Mode_Key);
      if (isDark != null) {
        result = isDark;
      }
      return result;
    } catch (e) {
      debugPrint('$e');
      return result;
    }
  }

  @override
  Future<Either<String, bool>> saveLang({required String locale}) async {
    try {
      final result = await helper.saveDataSharedPreference(
        key: Current_Language_Key,
        value: locale,
      );
      if (!result) {
        throw const PreferenceException(
            message: "Error saving app locale val!");
      }
      return Right(result);
    } catch (e) {
      return Left("$e");
    }
  }

  @override
  Future<Either<String, bool>> saveMode({required bool isDark}) async {
    try {
      final result = await helper.saveDataSharedPreference(
        key: Current_Theme_Mode_Key,
        value: isDark,
      );
      if (!result) {
        throw const PreferenceException(
            message: "Error saving app is dark mode val!");
      }
      return Right(result);
    } catch (e) {
      return Left("$e");
    }
  }
}
