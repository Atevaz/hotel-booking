import 'package:booking_hotel/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeHotelsHeadlineView extends StatelessWidget {
  const HomeHotelsHeadlineView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Best Deals",
          style: TextStyle(
            fontSize: 25.sp,
            fontWeight: FontWeight.w900,
          ),
        ),
        Material(
          color: AppColor.whitesMoke,
          child: InkWell(
            onTap: () {},
            child: Row(
              children: [
                Text(
                  "View all",
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w900,
                    color: AppColor.green,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                const Icon(
                  Icons.arrow_forward,
                  color: AppColor.green,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
