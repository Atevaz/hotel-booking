import 'package:booking_hotel/core/styles/colors.dart';
import 'package:booking_hotel/presentation/widget/headline_text.dart';
import 'package:booking_hotel/presentation/widget/medium_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeSliverAppBarBackgroundView extends StatelessWidget {
  HomeSliverAppBarBackgroundView({
    Key? key,
    required this.viewHotels,
  }) : super(key: key);

  final String name = 'HotelTonight';
  final String desc = 'Book one of your unique hotel to escape the ordinary';
  final Function() viewHotels;

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      collapseMode: CollapseMode.pin,
      background: Padding(
        padding: EdgeInsets.only(
          bottom: 30.h,
          left: 20.w,
          right: 20.w,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeadLineText(
              text: name,
              fontSize: 28.sp,
              isUpper: false,
              color: AppColor.white,
            ),
            SizedBox(
              height: 15.h,
            ),
            MediumText(
              text: desc,
              fontSize: 20.sp,
              color: AppColor.lightGrey,
            ),
            SizedBox(
              height: 20.h,
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
                text: "Search Hotels",
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
