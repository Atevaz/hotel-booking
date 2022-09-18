import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../business_logic/global_cubit/global_cubit.dart';

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
    return Text(
      isUpper! ? text.toUpperCase() : text,
      style: TextStyle(
          color: color ?? GlobalCubit.get(context).headLineTextColor,
          fontFamily: 'SemiBold',
          fontSize: fontSize.sp,
          overflow: overflow),
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
