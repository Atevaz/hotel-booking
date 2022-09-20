import 'package:booking_hotel/core/styles/colors.dart';
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
        Text(
          "Best Deals",
          style: TextStyle(
            fontFamily: 'Avenir',
            fontSize: 25.sp,
            fontWeight: FontWeight.w900,
          ),
        ),
        Material(
          color: AppColor.lightGrey,
          child: InkWell(
            onTap: viewAll,
            child: Row(
              children: [
                Text(
                  "View all",
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Avenir',
                    color: AppColor.teal,
                  ),
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
