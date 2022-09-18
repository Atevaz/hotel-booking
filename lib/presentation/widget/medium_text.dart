import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../business_logic/global_cubit/global_cubit.dart';

class MediumText extends StatelessWidget {
  final String text;
  final Color? color;
  final double fontSize;
  final int maxLines;
  final TextOverflow overflow;

  const MediumText({
    Key? key,
    required this.text,
    this.color,
    this.fontSize = 20,
    this.maxLines = 3,
    this.overflow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color ?? GlobalCubit.get(context).mediumTextColor,
          fontFamily: 'Medium',
          fontSize: fontSize.sp,
          overflow: overflow),
      maxLines: maxLines,
    );
  }
}
