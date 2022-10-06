import 'package:booking_hotel/business_logic/business_logic.dart';
import 'package:booking_hotel/core/styles/colors.dart';
import 'package:booking_hotel/core/utils/string_extension.dart';
import 'package:booking_hotel/presentation/widget/app_custom_rate_bar.dart';
import 'package:booking_hotel/presentation/widget/headline_text.dart';
import 'package:booking_hotel/presentation/widget/medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:booking_hotel/core/constants/end_points.dart';

class HomeCardView extends StatelessWidget {
  const HomeCardView({
    Key? key,
    required this.onTap,
    this.image = myImage,
    required this.name,
    required this.location,
    required this.address,
    required this.rate,
    required this.price,
    this.onDoubleTap,
  }) : super(key: key);

  final Function() onTap;
  final Function()? onDoubleTap;
  final String image;
  final String name;
  final String location;
  final String address;
  final double rate;
  final double price;

  static const String myImage =
      "https://images.unsplash.com/photo-1529619768328-e37af76c6fe5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80";

  @override
  Widget build(BuildContext context) {
    final isEng = GlobalCubit.get(context).isEng;
    return Material(
      elevation: 5.r,
      borderRadius: BorderRadius.circular(20.r),
      clipBehavior: Clip.hardEdge,
      color: Theme.of(context).cardColor,
      child: InkWell(
        onDoubleTap: onDoubleTap,
        onTap: onTap,
        child: SizedBox(
          height: 170.h,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Image.network(
                  image.contains("http")
                      ? image
                      : image.isNotEmpty
                          ? "$baseApiUrl$apiImagesVersion/$image"
                          : myImage,
                  loadingBuilder: (ctx, child, event) {
                    if (event == null) return child;
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                  errorBuilder: (ctx, child, err) {
                    if (err == null) return child as Widget;
                    return const Center(
                      child: Icon(
                        Icons.error,
                        size: 30,
                      ),
                    );
                  },
                  fit: BoxFit.cover,
                  height: 160,
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.all(10.r),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          HeadLineText(
                            text: name,
                            fontSize: 19.sp,
                            isUpper: false,
                            maxLines: 1,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          MediumText(
                            text: address,
                            fontSize: 17.sp,
                            color: AppColor.grey,
                            maxLines: 1,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: AppColor.teal,
                                      size: 25.r,
                                    ),
                                    Expanded(
                                      child: MediumText(
                                        text: location,
                                        color: AppColor.grey,
                                        fontSize: 15.sp,
                                        maxLines: 1,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                AppCustomRateBar(
                                  rate: rate,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              HeadLineText(
                                text: isEng
                                    ? "\$${price.toInt()}"
                                    : "\$${price.toInt()}".replaceFarsiNumber(),
                                fontSize: 20.sp,
                                isUpper: false,
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              MediumText(
                                text: "/per night",
                                fontSize: 16.sp,
                                color: Colors.grey,
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
