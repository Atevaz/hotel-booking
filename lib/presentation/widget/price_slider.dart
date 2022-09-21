import 'package:flutter/material.dart';

class PriceSlider extends StatefulWidget {
  const PriceSlider({Key? key}) : super(key: key);

  @override
  State<PriceSlider> createState() => _PriceSliderState();
}

class _PriceSliderState extends State<PriceSlider> {
  @override
  Widget build(BuildContext context) {
    var selectedRange = const RangeValues(500, 2000);

    return RangeSlider(
      values: selectedRange,
      max: 5000,
      divisions: 200,
      labels: RangeLabels(
        selectedRange.start.round().toString(),
        selectedRange.end.round().toString(),
      ),
      onChanged: (RangeValues values) {
        setState(() {
          selectedRange = values;
        });
      },
    );
  }
}
