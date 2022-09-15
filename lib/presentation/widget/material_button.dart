import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/colors.dart';
import 'headline_text.dart';


class MyMaterialButton extends StatelessWidget {
  final Color color;

  final void Function() onPressed;

  final String text;

  final double width;
  final bool isUpper ;


  const MyMaterialButton({
    Key? key,
    this.color = Colors.blue,
    required this.onPressed,
    required this.text,
     this.width = double.infinity,
    this.isUpper = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 54.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: MaterialButton(
        color: color,
        height: 52.h,
        onPressed: onPressed,
        child: HeadLineText(
          text: isUpper ? text.toUpperCase() : text,
          color: AppColor.white,
          fontSize: 20.sp,
        ),
      ),
    );
  }
}
