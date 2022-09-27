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
        title: title != null ? Text(title!) : const Text(''),
        actions: actions,
        centerTitle: centerTitle,
        // backgroundColor: AppColor.black,
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
          title: Text(title!),
          titleSpacing: 25.w,
        );
      }
    }
  }
}
