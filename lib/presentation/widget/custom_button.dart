import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/styles/colors.dart';
import 'headline_text.dart';

class MyButton extends StatelessWidget {
  final Color color;

  final void Function() onPressed;

  final String text;

  final double width;
  final bool isUpper;

  final double borderRadius;

  const MyButton({
    Key? key,
    this.color = AppColor.teal,
    required this.onPressed,
    required this.text,
    this.width = double.infinity,
    this.isUpper = true,
    this.borderRadius = 12,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 54.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius.r),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: MaterialButton(
        color: color,
        height: 52.h,
        onPressed: onPressed,
        child: HeadLineText(
          text: text.tr(),
          color: AppColor.white,
          fontSize: 20.sp,
          isUpper: isUpper,
        ),
      ),
    );
  }
}
