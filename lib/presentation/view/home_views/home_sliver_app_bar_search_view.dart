import 'package:booking_hotel/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeSliverAppBarSearchView extends StatelessWidget {
  const HomeSliverAppBarSearchView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 50.h),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: AppColor.green,
            size: 30.r,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 15.h),
          hintText: "Where are you going?",
          hintStyle: TextStyle(
            color: AppColor.grey,
            fontSize: 20.sp,
          ),
          fillColor: AppColor.whitesMoke,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(30.r),
          ),
        ),
      ),
    );
  }
}
