import 'package:booking_hotel/core/constants/end_points.dart';
import 'package:booking_hotel/core/styles/colors.dart';
import 'package:booking_hotel/presentation/widget/app_custom_rate_bar.dart';
import 'package:booking_hotel/presentation/widget/medium_text.dart';
import 'package:booking_hotel/presentation/widget/regular_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HotelCard extends StatelessWidget {
  const HotelCard({
    Key? key,
    required this.onTap,
    this.name = 'Grand Royal Hotel',
    this.address = 'Haram, Giza',
    this.price = 180,
    this.rate = 4.5,
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
      color: AppColor.lightGrey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5,
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: onTap,
        child: Column(
          children: [
            image.contains("http")
                ? Image.network(image)
                : !image.contains("assets") && image.isNotEmpty
                    ? Image.network("$baseApiUrl$apiImagesVersion/$image")
                    : Image.asset(
                        'assets/images/hotel.jpg',
                      ),
            Padding(
              padding: EdgeInsets.all(15.0.r),
              child: Column(
                children: [
                  Row(
                    children: [
                      MediumText(text: name),
                      const Spacer(),
                      MediumText(text: "\$$price"),
                    ],
                  ),
                  Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                              child: RegularText(text: address),
                            ),
                            const WidgetSpan(
                              child: Icon(
                                Icons.location_on,
                                color: AppColor.teal,
                              ),
                            ),
                            WidgetSpan(
                              child: RegularText(text: '$distance km to city'),
                            )
                          ],
                        ),
                      ),
                      const Spacer(),
                      const RegularText(text: '/per night')
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      AppCustomRateBar(rate: rate),
                      const RegularText(text: ' 80 Reviews')
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
