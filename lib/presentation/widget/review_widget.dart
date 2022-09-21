import 'package:booking_hotel/core/styles/colors.dart';
import 'package:booking_hotel/presentation/widget/star_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewWidget extends StatefulWidget {
  const ReviewWidget({super.key});

  @override
  State<ReviewWidget> createState() => _ReviewWidgetState();
}

class _ReviewWidgetState extends State<ReviewWidget> {
  double rating = 3.5;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 25.h,
        ),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 75.w,
                    height: 75.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        image: DecorationImage(
                            image: AssetImage(
                              'assets/images/woman.jpg',
                            ),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Alexia Jane',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 2.5.h,
                      ),
                      Text('Last updated 20 Apr 2021'),
                      SizedBox(
                        height: 2.5.h,
                      ),
                      Row(
                        children: [
                          Text('$rating'),
                          SizedBox(
                            width: 2.w,
                          ),
                          StarRating(
                            rating: rating,
                            color: AppColor.teal,
                            onRatingChanged: (rating) =>
                                setState(() => this.rating = rating),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                  'This is located in a great spot close shops, very quiet location'),
              Container(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.arrow_right_alt,
                  size: 35,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}