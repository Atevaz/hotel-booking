import 'package:booking_hotel/core/styles/colors.dart';
import 'package:booking_hotel/presentation/widget/headline_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeHotelsHeadlineView extends StatelessWidget {
  const HomeHotelsHeadlineView({
    Key? key,
    required this.viewAll,
  }) : super(key: key);

  final Function() viewAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HeadLineText(
          text: "Best Deals",
          fontSize: 25.sp,
          isUpper: false,
        ),
        Material(
          color: AppColor.lightGrey,
          child: InkWell(
            onTap: viewAll,
            child: Row(
              children: [
                HeadLineText(
                  text: "View all",
                  fontSize: 22.sp,
                  color: AppColor.teal,
                  isUpper: false,
                ),
                const SizedBox(
                  width: 8,
                ),
                const Icon(
                  Icons.arrow_forward,
                  color: AppColor.teal,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
