import 'dart:math';

import 'package:booking_hotel/business_logic/business_logic.dart';
import 'package:booking_hotel/core/router/app_router_names.dart';
import 'package:booking_hotel/core/styles/colors.dart';
import 'package:booking_hotel/core/utils/media_query_extension.dart';
import 'package:booking_hotel/core/utils/string_extension.dart';
import 'package:booking_hotel/data/model/hotel_model.dart';
import 'package:booking_hotel/presentation/widget/custom_button.dart';
import 'package:booking_hotel/presentation/widget/headline_text.dart';
import 'package:booking_hotel/presentation/widget/medium_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui' as ui;

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
    final isEng = GlobalCubit.get(context).isEng;
    final facilities = HotelCubit.get(context).facilities;
    final myFacilities = facilities
        .where(
          (e) => hotel.hotelFacilities!.any(
            (element) => element.facilityId == e.id || element.id == e.id,
          ),
        )
        .toList();
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
                    height: 200.h,
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
                        padding: EdgeInsets.all(20.r),
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
                                        overflow: TextOverflow.visible,
                                        maxLines: 100,
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      MediumText(
                                        text: hotel.address,
                                        color: AppColor.grey,
                                        fontSize: 17.sp,
                                        overflow: TextOverflow.visible,
                                        maxLines: 100,
                                      )
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    HeadLineText(
                                      text: isEng
                                          ? '\$${hotel.price.toInt()}'
                                          : '\$${hotel.price.toInt()}'
                                              .replaceFarsiNumber(),
                                      fontSize: 22.sp,
                                    ),
                                    const MediumText(
                                      text: '/per night',
                                      color: AppColor.grey,
                                    )
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            const Divider(
                              color: AppColor.grey,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: AppColor.grey.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      HeadLineText(
                                        text: isEng
                                            ? '${hotel.rate}'
                                            : '${hotel.rate}'
                                                .replaceFarsiNumber(),
                                        textAlign: TextAlign.center,
                                        color: AppColor.teal,
                                        fontSize: 40,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.w),
                                        child: const MediumText(
                                          text: 'Overall rating',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: myFacilities.length > 4
                                        ? 130.h
                                        : myFacilities.isNotEmpty
                                            ? 100.h
                                            : 0,
                                    child: GridView.builder(
                                      padding: EdgeInsets.zero,
                                      itemCount: myFacilities.length,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisExtent: 40,
                                      ),
                                      itemBuilder: (_, index) => Row(
                                        children: [
                                          MediumText(
                                              text:
                                                  '${myFacilities[index].name}'),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          CircleAvatar(
                                            radius: 15.r,
                                            backgroundColor: AppColor.teal,
                                            child: Center(
                                              child: Icon(
                                                Icons.check_outlined,
                                                color: AppColor.white,
                                                size: 25.r,
                                              ),
                                            ),
                                          ),
                                        ],
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
                              trimExpandedText: ' less'.tr(),
                              trimCollapsedText: ' more'.tr(),
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
                              text: !isBooking ? 'Book now' : 'Cancel Booking',
                              ///
                              onPressed: !isBooking
                                  ? book
                                  : () => showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.r),
                                            ),
                                            title: const HeadLineText(
                                              text: 'Cancel Booking',
                                              isUpper: false,
                                            ),
                                            backgroundColor:
                                                Theme.of(context).cardColor,
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
                              isUpper: false,
                              color: !isBooking ? AppColor.teal : Colors.red,
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
                  color: Colors.black.withOpacity(0.7),
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
                            color: AppColor.white,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Directionality(
                            textDirection: ui.TextDirection.ltr,
                            child: Transform.rotate(
                              angle: 270 * pi / 180,
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
                )),
          ],
        ),
      ),
    );
  }
}
