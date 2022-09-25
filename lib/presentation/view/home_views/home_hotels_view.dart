import 'package:booking_hotel/business_logic/hotels_cubit/hotels_cubit.dart';
import 'package:booking_hotel/core/di/di.dart';
import 'package:booking_hotel/core/router/app_router_names.dart';
import 'package:booking_hotel/presentation/view/home_views/home_card_view.dart';
import 'package:booking_hotel/presentation/view/home_views/home_hotel_headline_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeHotelsView extends StatelessWidget {
  const HomeHotelsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelsCubit, HotelsState>(
      builder: (context, state) {
        final cubit = HotelsCubit.get(context);
        return SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 15.h,
          ),
          sliver: SliverAnimatedList(
            initialItemCount: cubit.hotels.length,
            itemBuilder: (_, index, anim) {
              EdgeInsets insets = EdgeInsets.zero;
              Widget item = HomeCardView(
                name: '${cubit.hotels[index].name}',
                image: '${cubit.hotels[index].hotelImages![0].image}',
                price: double.parse(cubit.hotels[index].price!),
                rate: double.parse(cubit.hotels[index].rate!),
                location: '${cubit.hotels[index].address}',
                onTap: () => Navigator.pushNamed(
                    context, AppRouterNames.rHotelDetailsLayoutRoute),
              );
              // if (index != cubit.hotels.length) {
              //   insets = EdgeInsets.only(bottom: 25.h);
              // }
              // if (index == 0) {
              //   item = HomeHotelsHeadlineView(
              //     viewAll: () {
              //       Navigator.pushNamed(
              //           context, AppRouterNames.rExploreLayoutRoute);
              //     },
              //   );
              // } else {
              //   item = HomeCardView(
              //     name: '${cubit.hotels[index - 1].name}',
              //     image: '${cubit.hotels[index - 1].hotelImages![0].image}',
              //     price: double.parse(cubit.hotels[index - 1].price!),
              //     rate: double.parse(cubit.hotels[index - 1].rate!),
              //     location: '${cubit.hotels[index - 1].address}',
              //     onTap: () => Navigator.pushNamed(
              //         context, AppRouterNames.rHotelDetailsLayoutRoute),
              //   );
              // }
              // return Padding(
              //   padding: insets,
              //   child: item,
              // );
              return HomeCardView(
                name: '${cubit.hotels[index].name}',
                image: '${cubit.hotels[index].hotelImages![0].image}',
                price: double.parse(cubit.hotels[index].price!),
                rate: double.parse(cubit.hotels[index].rate!),
                location: '${cubit.hotels[index].address}',
                onTap: () => Navigator.pushNamed(
                    context, AppRouterNames.rHotelDetailsLayoutRoute),
              );
            },
          ),
        );
      },
    );
  }
}
