import 'package:booking_hotel/core/router/app_router_names.dart';
import 'package:booking_hotel/business_logic/business_logic.dart';
import 'package:booking_hotel/presentation/view/hotel_card.dart';
import 'package:booking_hotel/presentation/widget/medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({
    Key? key,
    this.err,
    required this.searching,
  }) : super(key: key);

  final String? err;
  final bool searching;

  @override
  Widget build(BuildContext context) {
    final hotelCubit = HotelCubit.get(context);
    final bookCubit = BookingCubit.get(context);
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
                    controller: hotelCubit.searchListC,
                    physics: const BouncingScrollPhysics(),
                    itemCount: searching
                        ? hotelCubit.searchHotels.length + 1
                        : hotelCubit.searchHotels.length,
                    itemBuilder: (context, index) {
                      if (index == hotelCubit.searchHotels.length) {
                        return const Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                      final isBooking = bookCubit.upcomingBookingList.any(
                          (element) =>
                              element.hotelId ==
                              hotelCubit.searchHotels[index].id);
                      return Padding(
                        padding: !searching &&
                                index == hotelCubit.searchHotels.length - 1
                            ? EdgeInsets.only(bottom: 20.h)
                            : EdgeInsets.zero,
                        child: HotelCard(
                            name: hotelCubit.searchHotels[index].name,
                            address: hotelCubit.searchHotels[index].address,
                            price: hotelCubit.searchHotels[index].price,
                            image: hotelCubit.searchHotels[index].hotelImages !=
                                        null &&
                                    hotelCubit.searchHotels[index].hotelImages!
                                        .isNotEmpty
                                ? hotelCubit
                                    .searchHotels[index].hotelImages![0].image
                                : "",
                            rate: hotelCubit.searchHotels[index].rate,
                            onTap: () {
                              FocusManager.instance.primaryFocus?.unfocus();
                              final bookingId = isBooking
                                  ? BookingCubit.get(context)
                                      .upcomingBookingList
                                      .firstWhere((e) =>
                                          e.hotelId ==
                                          hotelCubit.searchHotels[index].id)
                                      .id
                                  : null;
                              final hotel = hotelCubit.searchHotels[index];
                              Navigator.pushNamed(
                                context,
                                AppRouterNames.rHotelDetailsLayoutRoute,
                                arguments: [
                                  bookingId,
                                  hotel,
                                  isBooking,
                                ],
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
