import 'package:booking_hotel/core/shared_preferences/preference_helper.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

abstract class GlobalRepository {
  late PreferenceHelper helper;

  Future<bool?> isDarkMode();

  Future<Locale?> appLang();

  Future<bool> appFirstUse();

  Future<Either<String, bool>> saveMode({
    required bool isDark,
    bool isEng = true,
  });

  Future<Either<String, bool>> saveLang({
    required String locale,
    bool isEng = true,
  });
}
