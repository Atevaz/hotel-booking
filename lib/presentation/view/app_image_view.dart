import 'package:booking_hotel/core/styles/colors.dart';
import 'package:booking_hotel/data/model/hotel_image_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_view/photo_view.dart';

class AppImageViewer extends StatelessWidget {
  const AppImageViewer({Key? key, required this.images}) : super(key: key);

  final List<HotelImageModel> images;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            itemCount: images.length,
            itemBuilder: (_, index) => PhotoView(
              imageProvider: Image(
                image: NetworkImage(
                    'http://api.mahmoudtaha.com/images/${images[index].image}'),
                fit: BoxFit.cover,
                height: double.infinity,
              ).image,
            ),
          ),
          Positioned(
            top: 45.h,
            left: 12.w,
            child: Material(
              color: Theme.of(context).cardColor,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              type: MaterialType.circle,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 12.w),
                  child: SizedBox(
                    width: 45.w,
                    height: 45.h,
                    child: Center(
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: AppColor.teal,
                          size: 30.r,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
