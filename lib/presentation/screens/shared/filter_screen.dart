import 'package:booking_hotel/presentation/view/my_app_bar.dart';
import 'package:booking_hotel/presentation/widget/app_custom_check_box.dart';
import 'package:booking_hotel/presentation/widget/custom_button.dart';
import 'package:booking_hotel/presentation/widget/headline_text.dart';
import 'package:booking_hotel/presentation/widget/medium_text.dart';
import 'package:booking_hotel/presentation/widget/price_slider.dart';
import 'package:booking_hotel/presentation/widget/slider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {},
        ),
      ),
      body: Column(children: [
        const HeadLineText(text: 'Filter'),
        SizedBox(
          height: 20.h,
        ),
        const PriceSlider(),
        SizedBox(
          height: 30.h,
        ),
        const MediumText(text: 'Facilities'),
        SizedBox(
          height: 20.h,
        ),
        Row(
          children: [
            Column(
              children: [
                AppCustomCheckBox(
                  checked: false,
                  text: 'Free Breakfast',
                  onTap: () {},
                ),
                AppCustomCheckBox(
                  checked: false,
                  text: 'Pool',
                  onTap: () {},
                ),
                AppCustomCheckBox(
                  checked: false,
                  text: 'Free WIfi',
                  onTap: () {},
                ),
              ],
            ),
            Column(
              children: [
                AppCustomCheckBox(
                  checked: false,
                  text: 'Free Parking',
                  onTap: () {},
                ),
                AppCustomCheckBox(
                  checked: false,
                  text: 'Air Conditioner',
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 30.h,
        ),
        const MediumText(text: 'Distance from city center'),
        SliderWidget(),
      ]),
      bottomNavigationBar: MyButton(
        text: 'Apply',
        onPressed: () {},
      ),
    );
  }
}
