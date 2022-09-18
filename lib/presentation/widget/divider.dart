import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/styles/colors.dart';


Widget myDivider({
  Color? color,
  bool tillEnd = false,
  double size = 0.3,

}) => Padding(
  padding:  EdgeInsetsDirectional.only(
    start: 20,
    end: tillEnd? 0 : 20,
  ),
  child: Container(
    height: size.h,
    width: double.infinity,
    color: color ?? AppColor.grey,
  ),
);