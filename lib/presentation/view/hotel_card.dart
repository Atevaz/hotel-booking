import 'package:booking_hotel/business_logic/global_cubit/global_cubit.dart';
import 'package:booking_hotel/core/constants/end_points.dart';
import 'package:booking_hotel/core/styles/colors.dart';
import 'package:booking_hotel/core/utils/string_extension.dart';
import 'package:booking_hotel/presentation/widget/app_custom_rate_bar.dart';
import 'package:booking_hotel/presentation/widget/headline_text.dart';
import 'package:booking_hotel/presentation/widget/medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HotelCard extends StatelessWidget {
  const HotelCard({
    Key? key,
    required this.onTap,
    required this.name,
    required this.address,
    required this.price,
    required this.rate,
    this.image = 'assets/images/hotel.jpg',
    this.distance = 2.0,
  }) : super(key: key);

  final Function() onTap;
  final String name;
  final String address;
  final double price;
  final double rate;
  final String image;
  final double distance;

  @override
  Widget build(BuildContext context) {
    final isEng = GlobalCubit.get(context).isEng;
    return Material(
      color: Theme.of(context).cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: onTap,
        child: Column(
          children: [
            image.contains("http")
                ? Image.network(
                    image,
                    loadingBuilder: (ctx, child, event) => event == null
                        ? child
                        : const Center(
                            child: CircularProgressIndicator(),
                          ),
                    errorBuilder: (ctx, child, err) => err == null
                        ? (child as Widget)
                        : const Center(
                            child: Icon(
                              Icons.error,
                              size: 30,
                            ),
                          ),
                  )
                : !image.contains("assets") && image.isNotEmpty
                    ? Image.network(
                        "$baseApiUrl$apiImagesVersion/$image",
                        loadingBuilder: (ctx, child, event) => event == null
                            ? child
                            : const Center(
                                child: CircularProgressIndicator(),
                              ),
                        errorBuilder: (ctx, child, err) => err == null
                            ? (child as Widget)
                            : const Center(
                                child: Icon(
                                  Icons.error,
                                  size: 30,
                                ),
                              ),
                      )
                    : Image.asset(
                        'assets/images/hotel.jpg',
                      ),
            Padding(
              padding: EdgeInsets.all(15.0.r),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HeadLineText(
                          text: name,
                          maxLines: 1,
                          fontSize: 20,
                          isUpper: false,
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Directionality(
                          textDirection: TextDirection.ltr,
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: AppColor.teal,
                                size: 20.r,
                              ),
                              Expanded(
                                child: MediumText(
                                  text: address,
                                  fontSize: 17,
                                  color: AppColor.grey,
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          children: [
                            AppCustomRateBar(rate: rate),
                            SizedBox(
                              width: 10.w,
                            ),
                            MediumText(
                              text: isEng ? '80' : '80'.replaceFarsiNumber(),
                              fontSize: 17.sp,
                              color: AppColor.grey,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            MediumText(
                              text: 'Reviews',
                              fontSize: 17.sp,
                              color: AppColor.grey,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HeadLineText(
                        text: isEng
                            ? "\$$price"
                            : "\$$price".replaceFarsiNumber(),
                        maxLines: 1,
                        fontSize: 20,
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      const MediumText(
                        text: '/per night',
                        fontSize: 17,
                        color: AppColor.grey,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
