import 'package:booking_hotel/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAppBar extends StatelessWidget {

  final bool isCompletedAppBar;
  Widget leadingIcon ;
  List<Widget>? actions;
  String? title;
  bool? isBack;

   MyAppBar({
    Key? key,
     this.isCompletedAppBar = true,
     this.title,
     this.isBack,
     this.leadingIcon = const Icon(Icons.arrow_back_ios),
     this.actions
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    if(isCompletedAppBar){
      return AppBar(
        leading: IconButton(
            onPressed: () {
              if (isBack == true) {
                Navigator.pop(context);
              }
            },
            icon: leadingIcon),
        title: title != null ? Text(title!) : const Text(''),
        actions: actions,
        centerTitle: false,
        // backgroundColor: AppColor.black,
      );
    }
    else{
      if(isBack!)
      {
        return AppBar(
          leading: IconButton(
              onPressed: () {
                if (isBack == true) {
                  Navigator.pop(context);
                }
              },
              icon: leadingIcon),
        );
      }
      else {
        return AppBar(
          title: Text(title!),
          titleSpacing: 25.w,
        );
      }
    }

  }
}
