import 'package:booking_hotel/presentation/widget/app_custom_rate_bar.dart';
import 'package:booking_hotel/presentation/widget/headline_text.dart';
import 'package:booking_hotel/presentation/widget/regular_text.dart';
import 'package:flutter/material.dart';

class HotelCard extends StatelessWidget {
  const HotelCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(children: [
        Image.asset('assets/hotel.jpg'),
        Row(
          children: const [
            HeadLineText(text: 'Grand Royal Hotel'),
            HeadLineText(text: "\$180"),
          ],
        ),
        Row(
          children: [
            RichText(
                text: const TextSpan(children: [
              WidgetSpan(
                child: RegularText(text: 'Wembley, London'),
              ),
              WidgetSpan(
                child: Icon(Icons.location_on),
              ),
              WidgetSpan(child: RegularText(text: '2.0km to city'))
            ])),
            const RegularText(text: '/per night')
          ],
        ),
        Row(
          children: const [
            AppCustomRateBar(rate: 4.5),
            RegularText(text: '80Reviews')
          ],
        )
      ]),
    );
  }
}
