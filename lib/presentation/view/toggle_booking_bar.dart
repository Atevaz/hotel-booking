import 'package:booking_hotel/business_logic/booking_cubit/booking_cubit.dart';
import 'package:booking_hotel/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';

class ToggleTabBar extends StatelessWidget {
  const ToggleTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookingCubit, BookingState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return FlutterToggleTab(
// width in percent
          width: 90,
          borderRadius: 20.r,
          height: 55.h,
          selectedIndex: BookingCubit.get(context).selectedBookingToggleTabBar,
          selectedBackgroundColors: const [
            AppColor.lightGrey,
          ],
          isShadowEnable: false,
          selectedTextStyle: TextStyle(
              color: AppColor.teal,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700),
          unSelectedTextStyle: TextStyle(
              color: AppColor.grey,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500),
          labels: const ['Upcoming', 'Completed', 'Canceled'],
          selectedLabelIndex: (index) {
            BookingCubit.get(context).changeSelectedBookingTabBar(index);
          },
          isScroll: false,
        );
      },
    );
  }
}
