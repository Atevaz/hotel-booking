import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultTextButton extends StatelessWidget {

  final String text ;
  final VoidCallback onPressed ;
  final Color color;

  const DefaultTextButton({Key? key , required this.text , required this.onPressed ,this.color = Colors.grey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
            color: color,
            fontFamily: 'SemiBold',
            fontSize: 20.sp
        ),
      ),
    );
  }
}
