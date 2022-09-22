import 'package:flutter/material.dart';

class PriceSlider extends StatelessWidget {
  const PriceSlider({
    Key? key,
    required this.rangeValues,
    required this.onChange,
  }) : super(key: key);

  final RangeValues rangeValues;
  final Function(RangeValues value) onChange;

  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      values: rangeValues,
      max: 5000,
      divisions: 200,
      labels: RangeLabels(
        rangeValues.start.round().toString(),
        rangeValues.end.round().toString(),
      ),
      onChanged: onChange,
    );
  }
}
