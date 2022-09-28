import 'dart:math';

import 'package:booking_hotel/business_logic/business_logic.dart';
import 'package:booking_hotel/core/router/app_router_names.dart';
import 'package:booking_hotel/core/styles/colors.dart';
import 'package:booking_hotel/core/utils/media_query_extension.dart';
import 'package:booking_hotel/data/model/hotel_model.dart';
import 'package:booking_hotel/presentation/widget/custom_button.dart';
import 'package:booking_hotel/presentation/widget/headline_text.dart';
import 'package:booking_hotel/presentation/widget/medium_text.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HotelMoreDetailsView extends StatelessWidget {
  const HotelMoreDetailsView({
    Key? key,
    required this.collapseAnimation,
    required this.hotel,
    required this.isBooking,
    required this.animate,
    required this.book,
  }) : super(key: key);

  final Animation<double> collapseAnimation;
  final HotelModel hotel;
  final bool isBooking;
  final Function() animate;
  final Function() book;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizeTransition(
        axisAlignment: 1,
        axis: Axis.vertical,
        sizeFactor: collapseAnimation,
        child: Stack(
          children: [
            Container(
              color: Theme.of(context).cardColor,
              width: context.screenWidth,
              height: context.screenHeight,
              child: Column(
                children: [
                  SizedBox(
                    width: context.screenWidth,
                    height: 150.h,
                    child: Image(
                      image: NetworkImage(
                        hotel.hotelImages != null &&
                                hotel.hotelImages!.isNotEmpty
                            ? 'http://api.mahmoudtaha.com/images/${hotel.hotelImages![0].image}'
                            : "https://images.unsplash.com/photo-1529619768328-e37af76c6fe5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
                      ),
                      fit: BoxFit.cover,
                      height: double.infinity,
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(15.r),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      HeadLineText(
                                        text: hotel.name,
                                        fontSize: 22.sp,
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      MediumText(
                                        text: hotel.address,
                                        color: AppColor.grey,
                                        fontSize: 17.sp,
                                      )
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    HeadLineText(
                                      text: '\$${hotel.price.toInt()}',
                                      fontSize: 22.sp,
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    const MediumText(
                                      text: '/per night',
                                      color: AppColor.grey,
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const Divider(
                              color: AppColor.grey,
                            ),
                            Text.rich(
                              TextSpan(
                                text: '${hotel.rate}',
                                style: TextStyle(
                                  fontSize: 40.sp,
                                  color: AppColor.teal,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: 'sans-serif',
                                  overflow: TextOverflow.ellipsis,
                                ),
                                children: [
                                  WidgetSpan(
                                    child: Padding(
                                      padding: EdgeInsets.only(bottom: 15.h),
                                      child: const MediumText(
                                        text: '    Overall rating',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            HeadLineText(
                              text: 'Description',
                              fontSize: 18.sp,
                              isUpper: false,
                            ),
                            ReadMoreText(
                              hotel.description,
                              trimLines: 5,
                              colorClickableText: AppColor.blue,
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.grey.shade500,
                                fontFamily: 'Medium',
                                overflow: TextOverflow.ellipsis,
                              ),
                              trimExpandedText: ' less',
                              trimCollapsedText: ' more',
                              trimMode: TrimMode.Line,
                              moreStyle: TextStyle(
                                fontSize: 18.sp,
                                color: AppColor.blue,
                                fontFamily: 'Medium',
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                HeadLineText(
                                  text: 'Photo',
                                  fontSize: 18.sp,
                                  isUpper: false,
                                ),
                                InkWell(
                                  onTap: () => Navigator.pushNamed(
                                    context,
                                    AppRouterNames.rHotelImagesLayoutRoute,
                                    arguments: hotel.hotelImages,
                                  ),
                                  child: Row(
                                    children: [
                                      MediumText(
                                        text: 'View all ',
                                        color: AppColor.teal,
                                        fontSize: 18.sp,
                                      ),
                                      Icon(
                                        Icons.arrow_forward,
                                        color: AppColor.teal,
                                        size: 25.r,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            SizedBox(
                              width: context.screenWidth,
                              height: 150.h,
                              child: ListView.separated(
                                itemCount: hotel.hotelImages!.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (_, index) => Container(
                                  width: 150.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.r),
                                    image: DecorationImage(
                                      image: Image.network(
                                        'http://api.mahmoudtaha.com/images/${hotel.hotelImages![index].image}',
                                      ).image,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        SizedBox(
                                  width: 10.w,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            MyButton(
                              text:
                                  !isBooking ? 'Book now' : 'Cancelled Booking',
                              onPressed: book,
                              borderRadius: 25,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
                bottom: 80.h,
                right: 12.w,
                child: Material(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  borderRadius: BorderRadius.circular(25.r),
                  color: GlobalCubit.get(context).isDark
                      ? AppColor.white
                      : Colors.grey.shade400,
                  child: InkWell(
                    onTap: animate,
                    child: Padding(
                      padding: EdgeInsets.all(10.r),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          MediumText(
                            text: 'Less Details',
                            fontSize: 18.sp,
                            color: AppColor.black,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Transform.rotate(
                            angle: 270 * pi / 180,
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 20.r,
                              color: AppColor.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
