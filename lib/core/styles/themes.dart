import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.blue,
  scaffoldBackgroundColor: AppColor.white,
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: AppColor.teal,
  ),
  appBarTheme: AppBarTheme(
    titleSpacing: 12,
    elevation: 0,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
    actionsIconTheme: const IconThemeData(
      color: Colors.black54,
    ),
    backgroundColor: AppColor.white,
    iconTheme: const IconThemeData(
      color: Colors.black54,
    ),
    titleTextStyle: TextStyle(
      fontSize: 24.sp,
      color: AppColor.black,
      fontFamily: 'SemiBold',
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: AppColor.lightGrey,
    selectedItemColor: AppColor.teal,
    unselectedItemColor: AppColor.grey,
    elevation: 0,
    selectedLabelStyle: TextStyle(
      fontFamily: 'Regular',
      fontSize: 17.sp,
    ),
    unselectedLabelStyle: TextStyle(
      fontFamily: 'Regular',
      fontSize: 17.sp,
    ),
    selectedIconTheme: const IconThemeData(
      size: 30,
    ),
    unselectedIconTheme: const IconThemeData(
      size: 30,
    ),
  ),
  iconTheme: const IconThemeData(
    color: AppColor.black,
  ),
  fontFamily: 'SemiBold',
  cardColor: AppColor.lightGrey,
  cardTheme: CardTheme(
    color: AppColor.lightGrey,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(30.r),
      ),
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.blue,
  scaffoldBackgroundColor: AppColor.black,
  appBarTheme: const AppBarTheme(
    titleSpacing: 12,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: AppColor.black,
    elevation: 0.0,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    titleTextStyle: TextStyle(
      fontSize: 24,
      color: AppColor.white,
      fontWeight: FontWeight.bold,
      fontFamily: 'SemiBold',
    ),
    actionsIconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: const Color(0xff242526),
    selectedItemColor: AppColor.teal,
    unselectedItemColor: AppColor.white,
    elevation: 0,
    selectedLabelStyle: TextStyle(
      fontFamily: 'Regular',
      fontSize: 17.sp,
    ),
    unselectedLabelStyle: TextStyle(
      fontFamily: 'Regular',
      fontSize: 17.sp,
    ),
    selectedIconTheme: const IconThemeData(
      size: 30,
    ),
    unselectedIconTheme: const IconThemeData(
      size: 30,
    ),
  ),
  textTheme: const TextTheme(
    caption: TextStyle(
      color: Color(0xFFD4D4D4),
    ),
  ),
  fontFamily: 'SemiBold',
  iconTheme: const IconThemeData(
    color: AppColor.white,
  ),
  cardColor: const Color(0xff242526),
  cardTheme: CardTheme(
    color: const Color(0xff242526),
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(30.r),
      ),
    ),
  ),
);
