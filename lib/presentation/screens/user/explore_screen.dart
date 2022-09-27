import 'package:booking_hotel/business_logic/booking_cubit/booking_cubit.dart';
import 'package:booking_hotel/business_logic/business_logic.dart';
import 'package:booking_hotel/core/constants/constant.dart';
import 'package:booking_hotel/core/router/app_router_names.dart';
import 'package:booking_hotel/data/models/hotel_search_models_response/hotel_model.dart';
import 'package:booking_hotel/presentation/view/hotel_card.dart';
import 'package:booking_hotel/presentation/widget/medium_text.dart';
import 'package:booking_hotel/presentation/widget/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                          ? explore.searchHotels.length + 1
                          : explore.searchHotels.length,
                      itemBuilder: (context, index) {
                        final isBooking = BookingCubit.get(context).removeDuplicates(BookingCubit.get(context).upcomingBookingList).any((element) => int.parse(element.hotelId!) == explore.searchHotels[index].id);
                        if (index == explore.searchHotels.length) {
                          return const Padding(
                            padding: EdgeInsets.only(bottom: 20),
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                        return Padding(
                          padding:
                              !searching && index == explore.searchHotels.length - 1
                                  ? EdgeInsets.only(bottom: 20.h)
                                  : EdgeInsets.zero,
                          child: HotelCard(
                              name: explore.searchHotels[index].name,
                              address: explore.searchHotels[index].address,
                              price: explore.searchHotels[index].price,
                              image: explore.searchHotels[index].images.isNotEmpty
                                  ? explore.searchHotels[index].images[0].image
                                  : "",
                              rate: explore.searchHotels[index].rate,
                              onTap: () {
                                FocusManager.instance.primaryFocus?.unfocus();
                                HotelModel? hotel ;
                                if(!isBooking) {
                                  hotel = explore.searchHotels[index];
                                }
                                else {
                                  explore.searchHotels[index].id = BookingCubit.get(context).upcomingBookingList.firstWhere((e)=>int.parse(e.hotelId!) == explore.searchHotels[index].id).id!;
                                  hotel = explore.searchHotels[index] ;
                                }

                                Navigator.pushNamed(
                                  context,
                                  AppRouterNames.rHotelDetailsLayoutRoute,
                                  arguments: [
                                    hotel,
                                    isBooking,
                                  ] ,
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
