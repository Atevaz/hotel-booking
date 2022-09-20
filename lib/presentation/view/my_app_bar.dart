import 'package:flutter/material.dart';

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

  }
}
