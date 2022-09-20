import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SliderWidget extends StatefulWidget {
  SliderWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: currentValue,
      max: 100,
      divisions: 4,
      onChanged: ((value) {
        setState(() {
          currentValue = value;
        });
      }),
    );
  }
}
