import 'package:booking_hotel/core/styles/colors.dart';
import 'package:booking_hotel/presentation/widget/app_custom_rate_bar.dart';
import 'package:booking_hotel/presentation/widget/headline_text.dart';
import 'package:booking_hotel/presentation/widget/medium_text.dart';
import 'package:booking_hotel/presentation/widget/regular_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HotelCard extends StatelessWidget {
  const HotelCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.lightGrey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(children: [
        Image.asset(
          'assets/images/hotel.jpg',
        ),
        Padding(
          padding: EdgeInsets.all(15.0.r),
          child: Column(
            children: [
              Row(
                children: const [
                  MediumText(text: 'Grand Royal Hotel'),
                  Spacer(),
                  MediumText(text: "\$180"),
                ],
              ),
              Row(
                children: [
                  RichText(
                      text: const TextSpan(children: [
                    WidgetSpan(
                      child: RegularText(text: 'Haram, Giza'),
                    ),
                    WidgetSpan(
                      child: Icon(
                        Icons.location_on,
                        color: AppColor.teal,
                      ),
                    ),
                    WidgetSpan(child: RegularText(text: '2.0km to city'))
                  ])),
                  const Spacer(),
                  const RegularText(text: '/per night')
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: const [
                  AppCustomRateBar(rate: 4.5),
                  RegularText(text: '80Reviews')
                ],
              ),
            ],
          ),
        )
      ]),
    );
  }
}
