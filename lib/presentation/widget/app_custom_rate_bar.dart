import 'package:booking_hotel/core/styles/colors.dart';
import 'package:flutter/material.dart';

class AppCustomRateBar extends StatelessWidget {
  const AppCustomRateBar({Key? key, required this.rate}) : super(key: key);

  final double rate;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        IconData data = Icons.star;
        if (index+1 < rate) {
          data = Icons.star_half;
        }
        return Icon(
          data,
          color: AppColor.green,
        );
      }),
    );
  }
}

//create home view , update home screen and create checkbox and rate bar component
