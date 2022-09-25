import 'package:booking_hotel/core/styles/colors.dart';
import 'package:booking_hotel/presentation/widget/headline_text.dart';
import 'package:booking_hotel/presentation/widget/medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeSliverAppBarBackgroundView extends StatelessWidget {
  const HomeSliverAppBarBackgroundView({
    Key? key,
    this.name = "Cape Town",
    this.desc = "Extraordinary five-stars outdoor activities",
    required this.viewHotels,
  }) : super(key: key);

  final String name;
  final String desc;
  final Function() viewHotels;

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      collapseMode: CollapseMode.pin,
      background: Padding(
        padding: EdgeInsets.only(
          bottom: 30.h,
          left: 20.w,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeadLineText(
              text: name,
              fontSize: 28.sp,
              color: AppColor.white,
              isUpper: false,
            ),
            SizedBox(
              height: 15.h,
            ),
            SizedBox(
              width: 250.w,
              child: MediumText(
                text: desc,
                fontSize: 20.sp,
                color: AppColor.white,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: AppColor.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 20.h,
                  horizontal: 30.w,
                ),
              ),
              onPressed: viewHotels,
              child: MediumText(
                text: "View Hotels",
                color: AppColor.white,
                fontSize: 20.sp,
              ),
            )
          ],
        ),
      ),
    );
  }
}
