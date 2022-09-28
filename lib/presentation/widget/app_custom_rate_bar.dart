import 'package:booking_hotel/core/styles/colors.dart';
import 'package:flutter/material.dart';

class AppCustomRateBar extends StatelessWidget {
  const AppCustomRateBar({
    Key? key,
    required this.rate,
    this.iconSize,
  }) : super(key: key);

  final double rate;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
        (index) {
          double rating = rate % 5;
          if (rating == 0) {
            rating = 5;
          }
          final intRate = rating.toInt();
          final decRate = int.parse(rating.toString().split(".")[1]);
          IconData data;
          if (index + 1 <= intRate) {
            data = Icons.star_outlined;
          } else if (index + 1 == intRate + 1 && decRate >= 5) {
            data = Icons.star_half_outlined;
          } else {
            data = Icons.star_border_outlined;
          }
          return Icon(
            data,
            color: AppColor.teal,
            size: iconSize,
          );
        },
      ),
    );
  }
}
