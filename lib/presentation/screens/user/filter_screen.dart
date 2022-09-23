import 'package:booking_hotel/data/models/hotel_search_models_response/facility_model.dart';
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
  const FilterScreen({Key? key, required this.facilities}) : super(key: key);

  final List<FacilityModel> facilities;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var selectedFacilities = <FacilityModel>[];
  static const defaultPriceRange = RangeValues(0, 0);
  static const defaultDistance = 0.0;
  var priceRange = defaultPriceRange;
  var distance = defaultDistance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, kToolbarHeight),
        child: MyAppBar(
          isCompletedAppBar: false,
          isBack: true,
          leadingIcon: Icon(Icons.close),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeadLineText(text: 'Filter'),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MediumText(text: "Price Range"),
                  PriceSlider(
                    rangeValues: priceRange,
                    onChange: (RangeValues value) {
                      setState(() {
                        priceRange = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  const MediumText(text: 'Facilities'),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    height: 115.h,
                    child: GridView.builder(
                      itemCount: widget.facilities.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 50,
                      ),
                      itemBuilder: (_, index) => AppCustomCheckBox(
                        checked: selectedFacilities
                            .contains(widget.facilities[index]),
                        text: widget.facilities[index].name,
                        onTap: () {
                          setState(() {
                            if (!selectedFacilities
                                .contains(widget.facilities[index])) {
                              selectedFacilities.add(widget.facilities[index]);
                            } else {
                              selectedFacilities
                                  .remove(widget.facilities[index]);
                            }
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const MediumText(text: 'Distance from my location'),
                  SliderWidget(
                    currentValue: distance,
                    onChanged: (double value) {
                      setState(() {
                        distance = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            const Spacer(),
            MyButton(
              text: 'Apply',
              onPressed: () {
                List<dynamic> data = List.generate(4, (index) => null);
                final min = priceRange.start;
                final max = priceRange.end;
                final facilityList = selectedFacilities;
                final selectedDistance = distance;
                if (min != max) {
                  data[0] = min;
                  data[1] = max;
                }
                data[2] = facilityList.isEmpty ? null : facilityList;
                data[3] = selectedDistance == 0 ? null : selectedDistance;
                Navigator.pop(context, data);
              },
            ),
            SizedBox(
              height: 15.h,
            ),
          ],
        ),
      ),
    );
  }
}
