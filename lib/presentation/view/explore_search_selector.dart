import 'package:booking_hotel/presentation/widget/medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExploreSearchSelector extends StatelessWidget {
  const ExploreSearchSelector({
    Key? key,
    required this.show,
    required this.onChange,
    required this.currentValue,
    required this.color,
  }) : super(key: key);

  final bool show;
  final Function(int? value) onChange;
  final int currentValue;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      alignment: Alignment.topCenter,
      curve: Curves.easeInOutCubic,
      duration: const Duration(milliseconds: 300),
      child: Container(
        height: show ? null : 0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
        ),
        margin: EdgeInsets.symmetric(
          vertical: show ? 10.h : 0.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Material(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: color,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30.r),
                topLeft: Radius.circular(30.r),
              ),
              child: InkWell(
                onTap: () => onChange(0),
                child: Row(
                  children: [
                    Radio<int>(
                      value: 0,
                      groupValue: currentValue,
                      onChanged: onChange,
                    ),
                    const MediumText(text: "Hotel Name"),
                  ],
                ),
              ),
            ),
            Material(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: color,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30.r),
                bottomLeft: Radius.circular(30.r),
              ),
              child: InkWell(
                onTap: () => onChange(1),
                child: Row(
                  children: [
                    Radio<int>(
                      value: 1,
                      groupValue: currentValue,
                      onChanged: onChange,
                    ),
                    const MediumText(text: "Hotel Address"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
