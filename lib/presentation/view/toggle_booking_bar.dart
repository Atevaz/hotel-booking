import 'package:booking_hotel/core/styles/colors.dart';
import 'package:booking_hotel/business_logic/booking_cubit/booking_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';

class ToggleTabBar extends StatelessWidget {
  const ToggleTabBar({Key? key, required this.cubit}) : super(key: key);

  final BookingCubit cubit;

  @override
  Widget build(BuildContext context) {
    return FlutterToggleTab(
      width: 90,
      borderRadius: 20.r,
      height: 55.h,
      selectedIndex: cubit.selectedBookingToggleTabBar,
      selectedBackgroundColors: const [
        AppColor.lightGrey,
      ],
      isShadowEnable: false,
      selectedTextStyle: TextStyle(
          color: AppColor.teal, fontSize: 16.sp, fontWeight: FontWeight.w700),
      unSelectedTextStyle: TextStyle(
          color: AppColor.grey, fontSize: 14.sp, fontWeight: FontWeight.w500),
      labels:  ['Upcoming'.tr(), 'Completed'.tr(), 'Canceled'.tr()],
      selectedLabelIndex: cubit.changeSelectedBookingTabBar,
      isScroll: false,
    );
  }
}
