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
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, kToolbarHeight),
        child: MyAppBar(
          isCompletedAppBar: false,
          isBack: true,
          leadingIcon: Icon(Icons.close),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                crossAxisAlignment: CrossAxisAlignment.start,
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
          const Spacer(),
          MyButton(
            text: 'Apply',
            onPressed: () {},
          ),
          SizedBox(
            height: 15.h,
          ),
        ]),
      ),
    );
  }
}
