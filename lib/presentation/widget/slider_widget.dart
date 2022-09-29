import 'package:flutter/material.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({
    Key? key,
    required this.currentValue,
    required this.onChanged,
  }) : super(key: key);

  final double currentValue;
  final Function(double value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Slider(
      label: '${currentValue.toInt()}',
      value: currentValue,
      max: 5000,
      divisions: 1000,
      onChanged: onChanged,
    );
  }
}
