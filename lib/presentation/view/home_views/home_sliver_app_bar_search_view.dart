import 'package:booking_hotel/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeSliverAppBarSearchView extends StatelessWidget {
  const HomeSliverAppBarSearchView({
    Key? key,
    required this.searchHotels,
  }) : super(key: key);

  final Function() searchHotels;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: searchHotels,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
        child: TextFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: AppColor.teal,
              size: 30.r,
            ),
            enabled: false,
            contentPadding: EdgeInsets.symmetric(
              vertical: 15.h,
              horizontal: 20.w,
            ),
            hintText: "Where are you going?",
            hintStyle: TextStyle(
              color: AppColor.grey,
              fontSize: 18.sp,
              fontFamily: 'Avenir',
            ),
            fillColor: AppColor.lightGrey,
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(30.r),
            ),
          ),
        ),
      ),
    );
  }
}
