import 'package:booking_hotel/core/styles/colors.dart';
import 'package:booking_hotel/presentation/widget/app_custom_rate_bar.dart';
import 'package:booking_hotel/presentation/widget/headline_text.dart';
import 'package:booking_hotel/presentation/widget/medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:booking_hotel/core/constants/end_points.dart';

class HomeCardView extends StatelessWidget {
  const HomeCardView({
    Key? key,
    required this.onTap,
    this.image = myImage,
    this.name = "Grand Royal Hotel",
    this.location = "2.0 km to city",
    this.address = "Wembley, London",
    this.rate = 4.5,
    this.price = 180,
    this.onDoubleTap,
  }) : super(key: key);

  final Function() onTap;
  final Function()? onDoubleTap;
  final String image;
  final String name;
  final String location;
  final String address;
  final double rate;
  final double price;

  static const String myImage =
      "https://images.unsplash.com/photo-1529619768328-e37af76c6fe5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80";

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.r,
      borderRadius: BorderRadius.circular(20.r),
      clipBehavior: Clip.hardEdge,
      color: AppColor.white,
      child: InkWell(
        onDoubleTap: onDoubleTap,
        onTap: onTap,
        child: SizedBox(
          height: 160.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Image.network(
                  image.contains("http")
                      ? image
                      : image.isNotEmpty
                          ? "$baseApiUrl$apiImagesVersion/$image"
                          : myImage,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.all(10.r),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          HeadLineText(
                            text: name,
                            fontSize: 19.sp,
                            isUpper: false,
                          ),
                          MediumText(
                            text: address,
                            fontSize: 17.sp,
                            color: AppColor.grey,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: AppColor.teal,
                                    size: 25.r,
                                  ),
                                  MediumText(
                                    text: location,
                                    color: AppColor.grey,
                                    fontSize: 15.sp,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              AppCustomRateBar(
                                rate: rate,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              HeadLineText(
                                text: "\$$price",
                                fontSize: 22.sp,
                                isUpper: false,
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              MediumText(
                                text: "/per night",
                                fontSize: 16.sp,
                                color: Colors.grey,
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
