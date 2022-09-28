import 'package:booking_hotel/core/constants/end_points.dart';
import 'package:booking_hotel/core/styles/colors.dart';
import 'package:booking_hotel/presentation/widget/app_custom_rate_bar.dart';
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
                              child: MediumText(
                                text: address,
                                fontSize: 16,
                                color: AppColor.grey,
                              ),
                            ),
                            const WidgetSpan(
                              child: Icon(
                                Icons.location_on,
                                color: AppColor.teal,
                              ),
                            ),
                            WidgetSpan(
                              child: MediumText(
                                text: '$distance km to city',
                                fontSize: 16,
                                color: AppColor.grey,
                              ),
                            )
                          ],
                        ),
                      ),
                      const Spacer(),
                      const MediumText(
                        text: '/per night',
                        fontSize: 16,
                        color: AppColor.grey,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      AppCustomRateBar(rate: rate),
                      const MediumText(
                        text: ' 80 Reviews',
                        fontSize: 16,
                        color: AppColor.grey,
                      )
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
