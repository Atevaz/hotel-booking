import 'package:booking_hotel/presentation/widget/headline_text.dart';
import 'package:booking_hotel/presentation/widget/medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAppBar extends StatelessWidget {
  final bool isCompletedAppBar;
  final Widget leadingIcon;

  final List<Widget>? actions;
  final String? title;
  final bool? isBack;
  final bool centerTitle;

  const MyAppBar(
      {Key? key,
      this.isCompletedAppBar = true,
      this.title,
      this.isBack,
      this.centerTitle = false,
      this.leadingIcon = const Icon(Icons.arrow_back_ios),
      this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isCompletedAppBar) {
      return AppBar(
        leading: IconButton(
            onPressed: () {
              if (isBack == true) {
                Navigator.pop(context);
              }
            },
            icon: leadingIcon),
        title: title != null ? HeadLineText(text:title!,isUpper: false,) : const Text(''),
        actions: actions,
        centerTitle: centerTitle,
      );
    } else {
      if (isBack!) {
        return AppBar(
          leading: IconButton(
              onPressed: () {
                if (isBack == true) {
                  Navigator.pop(context);
                }
              },
              icon: leadingIcon),
          centerTitle: centerTitle,
        );
      } else {
        return AppBar(
          title: HeadLineText(text:title!,isUpper: false,),
          titleSpacing: 25.w,
        );
      }
    }
  }
}
