import 'package:booking_hotel/business_logic/global_cubit/global_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MediumText extends StatelessWidget {
  final String text;
  final Color? color;
  final double fontSize;
  final int maxLines;
  final TextOverflow overflow;
  final TextAlign? textAlign;

  const MediumText({
    Key? key,
    required this.text,
    this.color,
    this.fontSize = 20,
    this.maxLines = 3,
    this.overflow = TextOverflow.ellipsis,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = GlobalCubit.get(context);
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: color ?? cubit.mediumTextColor,
        fontFamily: 'Medium',
        fontSize: fontSize.sp,
        overflow: overflow,
      ),
      maxLines: maxLines,
    ).tr();
  }
}
