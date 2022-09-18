import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../business_logic/global_cubit/global_cubit.dart';

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
    return Text(
      text,
      style: TextStyle(
        color: color ?? GlobalCubit.get(context).regularTextColor,
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
    );
  }
}
