import 'package:booking_hotel/core/styles/colors.dart';
import 'package:booking_hotel/presentation/widget/app_custom_rate_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  }) : super(key: key);

  final Function() onTap;
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
                  myImage,
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
                          Text(
                            name,
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontFamily: 'Avenir',
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Text(
                            address,
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontFamily: 'Avenir',
                              fontWeight: FontWeight.w500,
                              color: AppColor.grey,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: AppColor.teal,
                                    size: 25.r,
                                  ),
                                  Text(
                                    location,
                                    style: TextStyle(
                                      color: AppColor.grey,
                                      fontFamily: 'Avenir',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17.sp,
                                    ),
                                  )
                                ],
                              ),
                              AppCustomRateBar(
                                rate: rate,
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "\$$price",
                                style: TextStyle(
                                  fontSize: 25.sp,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'Avenir',
                                ),
                              ),
                              Text(
                                "/per night",
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Avenir',
                                  color: Colors.grey,
                                ),
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
