import 'package:booking_hotel/core/styles/colors.dart';
import 'package:booking_hotel/presentation/widget/medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultTextButton extends StatelessWidget {

  final String text ;
  final VoidCallback onPressed ;
  final Color color;

  const DefaultTextButton({Key? key , required this.text , required this.onPressed ,this.color = AppColor.teal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: MediumText(text: text,color: color,),
    );
  }
}
