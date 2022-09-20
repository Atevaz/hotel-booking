import 'package:flutter/material.dart';

class PriceSlider extends StatefulWidget {
  const PriceSlider({Key? key}) : super(key: key);

  @override
  State<PriceSlider> createState() => _PriceSliderState();
}

class _PriceSliderState extends State<PriceSlider> {
  @override
  Widget build(BuildContext context) {
    var selectedRange = const RangeValues(0, 1);

    return RangeSlider(
      values: selectedRange,
      onChanged: (RangeValues newRange) {
        setState(() {
          selectedRange = newRange;
        });
      },
      min: 0,
      max: 1000,
      divisions: 50,
      labels: RangeLabels('${selectedRange.start}', '${selectedRange.end}'),
    );
  }
}
