import 'dart:math';

import 'package:booking_hotel/core/styles/colors.dart';
import 'package:booking_hotel/core/utils/media_query_extension.dart';
import 'package:booking_hotel/data/model/hotel_model.dart';
import 'package:booking_hotel/presentation/widget/app_custom_rate_bar.dart';
import 'package:booking_hotel/presentation/widget/custom_button.dart';
import 'package:booking_hotel/presentation/widget/headline_text.dart';
import 'package:booking_hotel/presentation/widget/medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HotelLessDetailsView extends StatelessWidget {
  const HotelLessDetailsView({
    Key? key,
    required this.expandAnimation,
    required this.hotel,
    required this.isBooking,
    required this.animate,
    required this.book,
  }) : super(key: key);

  final Animation<double> expandAnimation;
  final HotelModel hotel;
  final bool isBooking;
  final Function() animate;
  final Function() book;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SizeTransition(
        axisAlignment: 1,
        axis: Axis.vertical,
        sizeFactor: expandAnimation,
        child: SizedBox(
          width: context.screenWidth,
          height: context.screenHeight,
          child: Stack(
            children: [
              Image(
                image: NetworkImage(
                  hotel.hotelImages != null && hotel.hotelImages!.isNotEmpty
                      ? 'http://api.mahmoudtaha.com/images/${hotel.hotelImages![0].image}'
                      : "https://images.unsplash.com/photo-1529619768328-e37af76c6fe5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
                ),
                fit: BoxFit.cover,
                height: double.infinity,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: Theme.of(context).cardColor,
                      ),
                      padding: EdgeInsets.only(
                        top: 20.r,
                        right: 20.r,
                        left: 20.r,
                        bottom: 20.r,
                      ),
                      margin: EdgeInsets.all(10.r),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          HeadLineText(
                            text: hotel.name,
                            maxLines: 2,
                            fontSize: 22,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    color: AppColor.teal,
                                  ),
                                  Expanded(
                                    child: MediumText(
                                      text: hotel.address,
                                      color: Colors.grey.shade500,
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Column(
                                    children: [
                                      MediumText(
                                        text: '\$${hotel.price.toInt()}',
                                        fontSize: 23.sp,
                                      ),
                                      MediumText(
                                        text: '/per night',
                                        color: Colors.grey.shade500,
                                        fontSize: 18.sp,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                children: [
                                  AppCustomRateBar(rate: hotel.rate),
                                  const MediumText(
                                    text: ' 80 Reviews',
                                    fontSize: 16,
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          MyButton(
                            text: !isBooking ? 'Book now' : 'Cancelled Booking',
                            onPressed: book,
                            borderRadius: 25,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: Material(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        borderRadius: BorderRadius.circular(25.r),
                        color: Theme.of(context).cardColor,
                        child: InkWell(
                          onTap: animate,
                          child: Padding(
                            padding: EdgeInsets.all(10.r),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                MediumText(
                                  text: 'More Details',
                                  fontSize: 18.sp,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Transform.rotate(
                                  angle: 90 * pi / 180,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 20.r,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
