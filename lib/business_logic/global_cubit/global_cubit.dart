import 'package:booking_hotel/core/styles/colors.dart';
import 'package:booking_hotel/core/styles/constant.dart';
import 'package:booking_hotel/data/repository/global/global_repository.dart';
import 'package:booking_hotel/presentation/screens/user/booking_screen.dart';
import 'package:booking_hotel/presentation/screens/user/home_screen.dart';
import 'package:booking_hotel/presentation/screens/user/profile_layout/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  Locale locale = const Locale("en");
  bool isDark = false;
  final GlobalRepository globalRepository;

  GlobalCubit({required this.globalRepository}) : super(GlobalInitial());

  // final TestApi repo;
  // UserModel? user;
  //
  // Future getHotel() async {
  //   emit(loading());
  //   final result = await repo.getHotels();
  //   result.fold(
  //     (l) {
  //       emit(err());
  //     },
  //     (r) {
  //       // TODO
  //       user = r;
  //       emit(loaded());
  //     },
  //   );
  // }

  static GlobalCubit get(context) => BlocProvider.of(context);
  Color cardColor = AppColor.white;
  Color colorOfFormField = AppColor.grey;
  Color backGroundOfToggleTap = AppColor.lightGrey;
  Color regularTextColor = AppColor.grey;
  Color headLineTextColor = AppColor.white;
  Color mediumTextColor = AppColor.white;

  Future<void> initApp() async {
    isDark = await globalRepository.isDarkMode();
    locale = await globalRepository.appLang();
    _updateCurrentMode();
    emit(GlobalInitState());
  }

  void _updateCurrentMode() {
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
  }

  Future<void> changeAppMode() async {
    _updateCurrentMode();
    final result = await globalRepository.saveMode(isDark: isDark);
    result.fold((l) {
      emit(AppModeSaveErrorState(l));
    }, (r) {
      emit(AppModeSavedState());
    });
  }

  int currentIndex = 0;

  void changeNavBar(index) {
    currentIndex = index;
    emit(ChangeNavBarState());
  }

  List<Widget> screens = [
    const HomeScreen(),
    const BookingScreen(),
    const ProfileScreen(),
  ];

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
    suffixForPassword = obscureForPassword
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(GlobalChangePasswordVisibilityState());
  }

  IconData suffixForConfirmPassword = Icons.visibility_outlined;
  bool obscureForConfirmPassword = true;

  void changeConfirmPasswordVisibility() {
    obscureForConfirmPassword = !obscureForConfirmPassword;
    suffixForConfirmPassword = obscureForConfirmPassword
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(GlobalChangeConfirmPasswordVisibilityState());
  }
}
