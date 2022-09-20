import 'package:booking_hotel/core/styles/colors.dart';
import 'package:booking_hotel/presentation/widget/medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCustomCheckBox extends StatelessWidget {
  const AppCustomCheckBox({
    Key? key,
    required this.checked,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  final bool checked;
  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(
            side: BorderSide(
              color: AppColor.grey,
              width: 2.w,
            ),
            activeColor: AppColor.teal,
            checkColor: AppColor.white,
            value: checked,
            onChanged: (val) => onTap(),
          ),
          MediumText(
            text: text,
            fontSize: 18.sp,
          )
        ],
      ),
    );
  }
}
