import 'package:booking_hotel/business_logic/business_logic.dart';
import 'package:booking_hotel/core/router/app_router_names.dart';
import 'package:booking_hotel/presentation/view/hotel_card.dart';
import 'package:booking_hotel/presentation/widget/medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({
    Key? key,
    this.err,
    required this.explore,
    required this.searching,
  }) : super(key: key);

  final String? err;
  final ExploreCubit explore;
  final bool searching;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: err == null
          ? Column(
              children: [
                SizedBox(
                  height: 25.h,
                ),
                Expanded(
                  child: ListView.separated(
                    controller: explore.listC,
                    physics: const BouncingScrollPhysics(),
                    itemCount: searching
                        ? explore.hotels.length + 1
                        : explore.hotels.length,
                    itemBuilder: (context, index) {
                      if (index == explore.hotels.length) {
                        return const Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                      return Padding(
                        padding:
                            !searching && index == explore.hotels.length - 1
                                ? EdgeInsets.only(bottom: 20.h)
                                : EdgeInsets.zero,
                        child: HotelCard(
                            name: explore.hotels[index].name,
                            address: explore.hotels[index].address,
                            price: explore.hotels[index].price,
                            image: explore.hotels[index].images.isNotEmpty
                                ? explore.hotels[index].images[0].image
                                : "",
                            rate: explore.hotels[index].rate,
                            onTap: () {
                              FocusManager.instance.primaryFocus?.unfocus();
                              Navigator.pushNamed(
                                context,
                                AppRouterNames.rHotelDetailsLayoutRoute,
                                arguments: explore.hotels[index] ,
                              );
                            }),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                      height: 20.h,
                    ),
                  ),
                ),
              ],
            )
          : Center(
              child: MediumText(
                textAlign: TextAlign.center,
                text: err!,
                color: Colors.red,
              ),
            ),
    );
  }
}
