import 'package:flutter/material.dart';


class MyAppBar extends StatelessWidget {

  final String title;
  Widget? leadingIcon;
  //Widget? actionIcon;
  List<Widget>? actions;
  final bool isBack ;



      MyAppBar({
    Key? key,
        this.isBack = true,
    this.title = '',
    this.leadingIcon,
    //this.actionIcon,
  this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            if(isBack == true) {
              Navigator.pop(context);
            }
          },

          icon: leadingIcon!
      ),
      title:Text(
          title
      ),
      actions: actions,
      centerTitle: false,
     // backgroundColor: AppColor.black,
    );
  }
}
