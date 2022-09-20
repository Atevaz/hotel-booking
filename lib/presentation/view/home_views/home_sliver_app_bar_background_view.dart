import 'package:booking_hotel/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeSliverAppBarBackgroundView extends StatelessWidget {
  const HomeSliverAppBarBackgroundView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      collapseMode: CollapseMode.pin,
      background: Padding(
        padding: EdgeInsets.only(
          bottom: 30.h,
          left: 30.w,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Cape Town",
              style: TextStyle(
                fontSize: 25.sp,
                color: AppColor.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            SizedBox(
              width: 250.w,
              child: Text(
                "Extraordinary five-stars outdoor activities",
                style: TextStyle(
                  fontSize: 20.sp,
                  letterSpacing: 0.6.sp,
                  height: 1.3.h,
                  color: AppColor.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.r),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 20.h,
                  horizontal: 30.w,
                ),
              ),
              onPressed: () {},
              child: Text(
                "View Hotel",
                style: TextStyle(
                  color: AppColor.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
