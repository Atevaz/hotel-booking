import 'package:booking_hotel/business_logic/booking_cubit/booking_cubit.dart';
import 'package:booking_hotel/business_logic/hotels_cubit/hotels_cubit.dart';
import 'package:booking_hotel/core/di/di.dart';
import 'package:booking_hotel/data/models/hotel_data/hotel.dart';
import 'package:booking_hotel/presentation/view/home_views/home_hotels_view.dart';
import 'package:booking_hotel/presentation/view/home_views/home_sliver_app_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      sl<HotelsCubit>()
        ..getHotels(),
      child: BlocBuilder<BookingCubit, BookingState>(
        builder: (context, state) {
          return BlocBuilder<HotelsCubit, HotelsState>(
            builder: (context, state) {
              final cubit = HotelsCubit.get(context);
              bool loading = false;
              int count = cubit.hotels.length;

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
                controller: cubit.listC,
                slivers: [
                  //TODO create page view with indicator
                  HomeSliverAppBarView(
                  ),
                  HomeHotelsView(
                    count: count,
                    hotels: cubit.hotels,
                    loading: loading,
                    err: err,
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
