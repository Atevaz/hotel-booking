import 'package:booking_hotel/data/model/facility_mode.dart';
import 'package:booking_hotel/presentation/view/my_app_bar.dart';
import 'package:booking_hotel/presentation/widget/app_custom_check_box.dart';
import 'package:booking_hotel/presentation/widget/custom_button.dart';
import 'package:booking_hotel/presentation/widget/headline_text.dart';
import 'package:booking_hotel/presentation/widget/medium_text.dart';
import 'package:booking_hotel/presentation/widget/price_slider.dart';
import 'package:booking_hotel/presentation/widget/slider_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({
    Key? key,
    required this.facilities,
    this.distanceFilter,
    this.priceRangeFilter,
    this.facilitiesFilter,
  }) : super(key: key);

  final List<FacilityModel> facilities;
  final double? distanceFilter;
  final RangeValues? priceRangeFilter;
  final List<FacilityModel>? facilitiesFilter;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  late List<FacilityModel> selectedFacilities;
  late RangeValues priceRange;

  late double distance;

  @override
  void initState() {
    distance = 0.0;
    selectedFacilities = [];
    priceRange = const RangeValues(0, 0);
    if (widget.distanceFilter != null) {
      distance = widget.distanceFilter!;
    }
    if (widget.facilitiesFilter != null) {
      selectedFacilities = widget.facilitiesFilter!;
    }
    if (widget.priceRangeFilter != null) {
      priceRange = widget.priceRangeFilter!;
    }
    super.initState();
  }

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
            HeadLineText(text: 'Filter'.tr()),
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
                        text: '${widget.facilities[index].name}',
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
                List<dynamic> data = List.generate(3, (index) => null);
                final priceR = priceRange;
                final facilityList = selectedFacilities;
                final selectedDistance = distance;
                data[0] = widget.priceRangeFilter != null &&
                            (widget.priceRangeFilter!.start == priceR.start &&
                                widget.priceRangeFilter!.end == priceR.end) ||
                        widget.priceRangeFilter == null &&
                            (priceR.start == 0 && priceR.end == 0)
                    ? null
                    : priceR;
                data[1] = widget.facilitiesFilter != null &&
                            widget.facilitiesFilter!.equals(facilityList) ||
                        widget.facilitiesFilter == null && facilityList.isEmpty
                    ? null
                    : facilityList;
                data[2] = widget.distanceFilter != null &&
                            widget.distanceFilter == selectedDistance ||
                        widget.distanceFilter == null && selectedDistance == 0
                    ? null
                    : selectedDistance;
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

extension ListEquality<T> on List<T> {
  bool equals(List<T> list) {
    if (length != list.length) {
      return false;
    }
    for (int i = 0; i < length; i++) {
      if ([i] != list[i]) {
        return false;
      }
    }
    return true;
  }
}
