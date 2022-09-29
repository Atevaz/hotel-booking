import 'package:booking_hotel/business_logic/global_cubit/global_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeadLineText extends StatelessWidget {
  final String text;
  final Color? color;
  final double fontSize;
  final int maxLines;
  final bool? isUpper;
  final TextAlign? textAlign;
  final TextOverflow overflow;

  const HeadLineText({
    Key? key,
    required this.text,
    this.color,
    this.fontSize = 25,
    this.maxLines = 1,
    this.overflow = TextOverflow.ellipsis,
    this.isUpper = true,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = GlobalCubit.get(context);
    return Text(
      isUpper! ? text.toUpperCase() : text,
      style: TextStyle(
          color: color ?? cubit.headLineTextColor,
          fontFamily: 'SemiBold',
          fontSize: fontSize.sp,
          overflow: overflow),
      maxLines: maxLines,
      textAlign: textAlign,
    ).tr();
  }
}
