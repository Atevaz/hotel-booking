import 'package:booking_hotel/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCustomCheckBox extends StatefulWidget {
  const AppCustomCheckBox({Key? key}) : super(key: key);

  @override
  State<AppCustomCheckBox> createState() => _AppCustomCheckBoxState();
}

class _AppCustomCheckBoxState extends State<AppCustomCheckBox> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          checked = !checked;
        });
      },
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
            onChanged: (val) {
              setState(() {
                checked = !checked;
              });
            },
          ),
          Text(
            "Free Breakfast",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
