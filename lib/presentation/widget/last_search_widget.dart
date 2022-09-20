import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LastSearcWidget extends StatelessWidget {
  LastSearcWidget(
      {super.key,
      required this.title,
      required this.status,
      required this.history,
      required this.image});
  String title;
  String status;
  String history;
  String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 450.h,
      child: GridView.count(
        crossAxisCount: 2,
        children: List.generate(20, (index) {
          return Center(
              child: Container(
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
            width: 180.w,
            height: 200.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    image: DecorationImage(
                        image: AssetImage(image), fit: BoxFit.cover),
                  ),
                ),
                Text(
                  title,
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                ),
                Text(status),
                Text(history),
              ],
            ),
          ));
        }),
      ),
    );
  }
}
