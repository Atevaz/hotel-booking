import 'dart:math';

import 'package:booking_hotel/business_logic/global_cubit/global_cubit.dart';
import 'package:booking_hotel/core/styles/colors.dart';
import 'package:booking_hotel/core/utils/media_query_extension.dart';
import 'package:booking_hotel/core/utils/string_extension.dart';
import 'package:booking_hotel/data/model/hotel_model.dart';
import 'package:booking_hotel/presentation/widget/app_custom_rate_bar.dart';
import 'package:booking_hotel/presentation/widget/custom_button.dart';
import 'package:booking_hotel/presentation/widget/headline_text.dart';
import 'package:booking_hotel/presentation/widget/medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui' as ui;

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
    final isEng = GlobalCubit.get(context).isEng;
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
                                        text: isEng
                                            ? '\$${hotel.price.toInt()}'
                                            : '\$${hotel.price.toInt()}'
                                                .replaceFarsiNumber(),
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
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  MediumText(
                                    text: isEng
                                        ? '80'
                                        : '80'.replaceFarsiNumber(),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  const MediumText(
                                    text: 'Reviews',
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
                            text: !isBooking ? 'Book now' : 'Cancel Booking',
                            onPressed: !isBooking
                                ? book
                                : () => showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20.r),
                                          ),
                                          title: const HeadLineText(
                                            text: 'Cancel Booking',
                                            isUpper: false,
                                          ),
                                          backgroundColor: Theme.of(context).cardColor,
                                          actionsOverflowButtonSpacing: 10.r,
                                          actions: [
                                            MyButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                book();
                                              },
                                              text: 'Ok',
                                              isUpper: false,
                                            ),
                                            MyButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              text: 'Cancel',
                                              isUpper: false,
                                            ),
                                          ],
                                          content: const MediumText(
                                            text:
                                                'Are you sure you want to cancel this booking?',
                                          ),
                                        );
                                      },
                                    ),
                            borderRadius: 25,
                            color: !isBooking ? AppColor.teal : Colors.red,
                            isUpper: false,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: Material(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        borderRadius: BorderRadius.circular(25.r),
                        color: Colors.black.withOpacity(0.7),
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
                                  color: AppColor.white,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Directionality(
                                  textDirection: ui.TextDirection.ltr,
                                  child: Transform.rotate(
                                    angle: 90 * pi / 180,
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      size: 20.r,
                                      color: AppColor.white,
                                    ),
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
