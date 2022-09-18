import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../core/styles/colors.dart';
import '../../core/styles/constant.dart';
import '../../data/local/cache_helper.dart';


class SwitchButton extends StatefulWidget {
  const SwitchButton({Key? key}) : super(key: key);

  @override
  _SwitchButtonState createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {

  bool isFingerPrintOne = false;

  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
      width: 70.0.w,
      activeColor: AppColor.blue,
      inactiveColor: AppColor.grey,
      height: 35.0.h,
      valueFontSize: 20.0.sp,
      toggleSize: 25.0.w,
      value: isFingerPrint!,
      borderRadius: 30.0,
      showOnOff: true,
      onToggle: (val) {
        setState(() {
          isFingerPrint = val ;
          CacheHelper.saveDataSharedPreference(key: 'isFingerPrint', value: val);
        });
      },
    );
  }
}
