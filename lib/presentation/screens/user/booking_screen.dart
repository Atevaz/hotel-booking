import 'package:booking_hotel/core/router/app_router_names.dart';
import 'package:booking_hotel/business_logic/booking_cubit/booking_cubit.dart';
import 'package:booking_hotel/presentation/view/hotel_card.dart';
import 'package:booking_hotel/presentation/view/my_app_bar.dart';
import 'package:booking_hotel/presentation/view/toggle_booking_bar.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingCubit, BookingState>(
      builder: (context, state) {
        final cubit = BookingCubit.get(context);
        final selectedTabBatIndex = cubit.selectedBookingToggleTabBar;
        bool upcomingCondition = false;
        if (state is GetUpcomingBookingLoadingState) {
          upcomingCondition = true;
        }
        bool completedCondition = false;
        if (state is GetCompletedBookingLoadingState) {
          completedCondition = true;
        }
        bool canceledCondition = false;
        if (state is GetCancelledBookingLoadingState) {
          canceledCondition = true;
        }
        final upcoming = cubit.upcomingBookingList;
        final completed = cubit.completedBookingList;
        final canceled = cubit.cancelledBookingList;
        return Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size(double.infinity, kToolbarHeight),
            child: MyAppBar(
              isCompletedAppBar: false,
              isBack: false,
              title: 'My Trips',
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(16.r),
            child: Column(
              children: [
                ToggleTabBar(
                  cubit: cubit,
                ),
                SizedBox(
                  height: 10.h,
                ),
                if (selectedTabBatIndex == 0)
                  ConditionalBuilder(
                    condition: !upcomingCondition,
                    builder: (context) => Expanded(
                      child: ListView.separated(
                        controller: cubit.upcomingC,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          final isBooking = upcoming.any((element) =>
                              element.hotelId == upcoming[index].hotelId);
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6.w),
                            child: HotelCard(
                              onTap: () => Navigator.pushNamed(
                                context,
                                AppRouterNames.rHotelDetailsLayoutRoute,
                                arguments: [
                                  upcoming[index].id,
                                  upcoming[index].hotel,
                                  isBooking
                                ],
                              ),
                              image: upcoming[index].hotel.hotelImages!.isNotEmpty
                                  ? upcoming[index].hotel.hotelImages![0].image
                                  : 'assets/images/hotel.jpg',
                              address: upcoming[index].hotel.address,
                              name: upcoming[index].hotel.name,
                              price:
                                  double.parse('${upcoming[index].hotel.price}'),
                              rate: double.parse('${upcoming[index].hotel.rate}'),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(
                          height: 10.h,
                        ),
                        itemCount: upcoming.length,
                      ),
                    ),
                    fallback: (context) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                if (cubit.selectedBookingToggleTabBar == 1)
                  ConditionalBuilder(
                    condition: !completedCondition,
                    builder: (context) => Expanded(
                      child: ListView.separated(
                        controller: cubit.completedC,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:  EdgeInsets.symmetric(horizontal:6.w),
                            child: HotelCard(
                              onTap: () => Navigator.pushNamed(
                                context,
                                AppRouterNames.rHotelDetailsLayoutRoute,
                                arguments: [
                                  completed[index].id,
                                  completed[index].hotel.id,
                                  false
                                ],
                              ),
                              image: completed[index]
                                      .hotel
                                      .hotelImages!
                                      .isNotEmpty
                                  ? completed[index].hotel.hotelImages![0].image
                                  : 'assets/images/hotel.jpg',
                              address: completed[index].hotel.address,
                              name: completed[index].hotel.name,
                              price:
                                  double.parse('${completed[index].hotel.price}'),
                              rate:
                                  double.parse('${completed[index].hotel.rate}'),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(
                          height: 10.h,
                        ),
                        itemCount: completed.length,
                      ),
                    ),
                    fallback: (context) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                if (cubit.selectedBookingToggleTabBar == 2)
                  ConditionalBuilder(
                    condition: !canceledCondition,
                    builder: (context) => Expanded(
                      child: ListView.separated(
                        controller: cubit.canceledC,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:  EdgeInsets.symmetric(horizontal:6.w),
                            child: HotelCard(
                              onTap: () => Navigator.pushNamed(
                                context,
                                AppRouterNames.rHotelDetailsLayoutRoute,
                                arguments: [
                                  canceled[index].id,
                                  canceled[index].hotel,
                                  false,
                                ],
                              ),
                              image: canceled[index].hotel.hotelImages!.isNotEmpty
                                  ? canceled[index].hotel.hotelImages![0].image
                                  : 'assets/images/hotel.jpg',
                              address: canceled[index].hotel.address,
                              name: canceled[index].hotel.name,
                              price:
                                  double.parse('${canceled[index].hotel.price}'),
                              rate: double.parse('${canceled[index].hotel.rate}'),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(
                          height: 10.h,
                        ),
                        itemCount: canceled.length,
                      ),
                    ),
                    fallback: (context) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
