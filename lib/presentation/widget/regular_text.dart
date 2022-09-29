import 'package:booking_hotel/business_logic/global_cubit/global_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegularText extends StatelessWidget {
  final String text;
  final Color? color;
  final double fontSize;
  final double lineHeight;
  final bool isLineThrow;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextOverflow overflow;

  const RegularText({
    Key? key,
    required this.text,
    this.color,
    this.fontSize = 16,
    this.maxLines,
    this.overflow = TextOverflow.ellipsis,
    this.textAlign,
    this.lineHeight = 1,
    this.isLineThrow = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = GlobalCubit.get(context);
    return Text(
      text,
      style: TextStyle(
        color: color ?? cubit.regularTextColor,
        fontFamily: 'Regular',
        fontSize: fontSize.sp,
        overflow: overflow,
        decoration: isLineThrow == false
            ? TextDecoration.none
            : TextDecoration.lineThrough,
        height: lineHeight,
      ),
      maxLines: maxLines,
      textAlign: textAlign,
    ).tr();
  }
}
