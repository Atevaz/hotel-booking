import 'package:booking_hotel/core/constants/end_points.dart';
import 'package:booking_hotel/core/styles/colors.dart';
import 'package:booking_hotel/presentation/widget/app_custom_rate_bar.dart';
import 'package:booking_hotel/presentation/widget/headline_text.dart';
import 'package:booking_hotel/presentation/widget/medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HotelCard extends StatelessWidget {
  const HotelCard({
    Key? key,
    required this.onTap,
    required this.name,
    required this.address,
    required this.price,
    required this.rate,
    this.image = 'assets/images/hotel.jpg',
    this.distance = 2.0,
  }) : super(key: key);

  final Function() onTap;
  final String name;
  final String address;
  final double price;
  final double rate;
  final String image;
  final double distance;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: onTap,
        child: Column(
          children: [
            image.contains("http")
                ? Image.network(
                    image,
                    loadingBuilder: (ctx, child, event) => event == null
                        ? child
                        : const Center(
                            child: CircularProgressIndicator(),
                          ),
                    errorBuilder: (ctx, child, err) => err == null
                        ? (child as Widget)
                        : const Center(
                            child: Icon(
                              Icons.error,
                              size: 30,
                            ),
                          ),
                  )
                : !image.contains("assets") && image.isNotEmpty
                    ? Image.network(
                        "$baseApiUrl$apiImagesVersion/$image",
                        loadingBuilder: (ctx, child, event) => event == null
                            ? child
                            : const Center(
                                child: CircularProgressIndicator(),
                              ),
                        errorBuilder: (ctx, child, err) => err == null
                            ? (child as Widget)
                            : const Center(
                                child: Icon(
                                  Icons.error,
                                  size: 30,
                                ),
                              ),
                      )
                    : Image.asset(
                        'assets/images/hotel.jpg',
                      ),
            Padding(
              padding: EdgeInsets.all(15.0.r),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HeadLineText(
                          text: name,
                          maxLines: 1,
                          fontSize: 20,
                          isUpper: false,
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: MediumText(
                                text: address,
                                fontSize: 17,
                                color: AppColor.grey,
                                maxLines: 1,
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  const WidgetSpan(
                                    child: Icon(
                                      Icons.location_on,
                                      color: AppColor.teal,
                                      size: 20,
                                    ),
                                  ),
                                  WidgetSpan(
                                    child: MediumText(
                                      text: '$distance km to city',
                                      fontSize: 16,
                                      color: AppColor.grey,
                                      maxLines: 1,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          children: [
                            AppCustomRateBar(rate: rate),
                            const MediumText(
                              text: ' 80 Reviews',
                              fontSize: 17,
                              color: AppColor.grey,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HeadLineText(
                        text: "\$$price",
                        maxLines: 1,
                        fontSize: 20,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      const MediumText(
                        text: '/per night',
                        fontSize: 17,
                        color: AppColor.grey,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
