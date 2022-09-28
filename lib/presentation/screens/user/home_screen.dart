import 'package:booking_hotel/business_logic/booking_cubit/booking_cubit.dart';
import 'package:booking_hotel/business_logic/hotel_cubit/hotel_cubit.dart';
import 'package:booking_hotel/presentation/view/home_views/home_hotels_view.dart';
import 'package:booking_hotel/presentation/view/home_views/home_sliver_app_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingCubit, BookingState>(
      builder: (context, state) {
        final bookingCubit = BookingCubit.get(context);
        return BlocBuilder<HotelCubit, HotelState>(
          builder: (context, state) {
            final hotelCubit = HotelCubit.get(context);
            bool loading = false;
            int count = hotelCubit.homeHotels.length;
            String? err;
            if (state is GetHotelsLoadingState) {
              loading = true;
              count++;
            }
            if (state is GetHotelsLoadingErrorState) {
              err = state.message;
            }
            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              controller: hotelCubit.homeListC,
              slivers: [
                const HomeSliverAppBarView(),
                HomeHotelsView(
                  count: count,
                  hotels: hotelCubit.homeHotels,
                  loading: loading,
                  err: err,
                  cubit: bookingCubit,
                ),
              ],
            );
          },
        );
      },
    );
  }
}
