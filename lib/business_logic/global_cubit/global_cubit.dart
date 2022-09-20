import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/styles/colors.dart';
import '../../core/styles/constant.dart';
import '../../data/local/cache_helper.dart';

import 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());

  static GlobalCubit get(context) => BlocProvider.of(context);
  Color cardColor = AppColor.white;
  Color colorOfFormField = AppColor.grey;
  Color backGroundOfToggleTap = AppColor.lightGrey;
  Color regularTextColor = AppColor.grey;
  Color headLineTextColor = AppColor.white;
  Color mediumTextColor = AppColor.white;

  bool isDark = false;

  void changeAppMode({bool? fromCache}) {
    if (fromCache != null) {
      isDark = fromCache;
    } else {
      isDark = !isDark;
    }
    CacheHelper.saveDataSharedPreference(key: 'isDark', value: isDark).then((value) {
      if (isDark) {
        cardColor = AppColor.black;
        colorOfFormField = AppColor.black;
        backGroundOfToggleTap = AppColor.black;
        regularTextColor = AppColor.lightGrey;
        headLineTextColor = AppColor.white;
        mediumTextColor = AppColor.white;
        appMode = ThemeMode.dark;
        emit(AppChangeModeDarkState());
      } else {
        cardColor = AppColor.white;
        backGroundOfToggleTap = AppColor.lightGrey;
        regularTextColor = AppColor.grey;
        headLineTextColor = AppColor.black;
        mediumTextColor = AppColor.black;
        colorOfFormField = AppColor.lightGrey;
        appMode = ThemeMode.light;
        emit(AppChangeModeLightState());
      }
    });
  }

  int currentIndex = 0;

  void changeNavBar(index) {
    currentIndex = index;
    emit(ChangeNavBarState());
  }

  Object? val = 'light';

  void changeValueOfRadioButton(value) {
    val = value;
    emit(ChangeValueOfRadioButtonAndCloseBottomSheetState());
  }

  void showThemeBottomSheet() {
    emit(ShowThemeBottomSheet());
  }

  void closeThemeBottomSheet() {
    emit(CloseThemeBottomSheet());
  }


  IconData suffixForPassword = Icons.visibility_outlined;
  bool obscureForPassword = true;

  void changePasswordVisibility() {
    obscureForPassword = !obscureForPassword;
    suffixForPassword = obscureForPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(GlobalChangePasswordVisibilityState());
  }

  IconData suffixForConfirmPassword = Icons.visibility_outlined;
  bool obscureForConfirmPassword = true;

  void changeConfirmPasswordVisibility() {
    obscureForConfirmPassword = !obscureForConfirmPassword;
    suffixForConfirmPassword = obscureForConfirmPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(GlobalChangeConfirmPasswordVisibilityState());
  }


}

