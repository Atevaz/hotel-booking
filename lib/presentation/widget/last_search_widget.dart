import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LastSearchWidget extends StatelessWidget {
  const LastSearchWidget({
    Key? key,
    required this.title,
    required this.status,
    required this.history,
    required this.image,
  }) : super(key: key);
  final String title;
  final String status;
  final String history;
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
