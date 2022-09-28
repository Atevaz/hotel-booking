import 'package:booking_hotel/core/styles/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CaptionOfOnBoarding extends StatelessWidget {
  final String text;

  final double fontSize;

  final Color color;

  const CaptionOfOnBoarding({
    Key? key,
    required this.text,
    this.fontSize = 20,
    this.color = AppColor.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: fontSize, color: color),
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
    ).tr();
  }
}
