import 'package:booking_hotel/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';

class ToggleTabBar extends StatefulWidget {
  const ToggleTabBar({Key? key}) : super(key: key);

  @override
  State<ToggleTabBar> createState() => _ToggleTabBarState();
}

class _ToggleTabBarState extends State<ToggleTabBar> {

  int selectedIndex = 0 ;

  @override
  Widget build(BuildContext context) {
    return FlutterToggleTab(
// width in percent
    width: 90,
      borderRadius: 20.r,
      height: 55.h,

      selectedIndex: selectedIndex,
      selectedBackgroundColors: [AppColor.lightGrey,],
      isShadowEnable: false,
      selectedTextStyle: TextStyle(
          color: AppColor.teal,
          fontSize: 16.sp,
          fontWeight: FontWeight.w700),
      unSelectedTextStyle: TextStyle(
          color: AppColor.grey,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500),
      labels: const ['Upcoming','Completed','Canceled'],
      selectedLabelIndex: (index) {
        setState(() {
          selectedIndex = index;
        });
      },
      isScroll: false,
    );
  }
}
