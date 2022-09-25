import 'package:booking_hotel/core/router/app_router_names.dart';
import 'package:booking_hotel/data/models/hotel_data/hotel.dart';
import 'package:booking_hotel/presentation/view/home_views/home_sliver_app_bar_background_view.dart';
import 'package:booking_hotel/presentation/view/home_views/home_sliver_app_bar_image_view.dart';
import 'package:booking_hotel/presentation/view/home_views/home_sliver_app_bar_search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeSliverAppBarView extends StatelessWidget {
  const HomeSliverAppBarView({Key? key, required this.hotel}) : super(key: key);

  final Hotel? hotel;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      pinned: true,
      floating: true,
      expandedHeight: 450.h,
      bottom: PreferredSize(
        preferredSize: Size(double.infinity.w, 130.h),
        child: Container(),
      ),
      flexibleSpace: Stack(
        children: [
          const HomeSliverAppBarImageView(),
          HomeSliverAppBarBackgroundView(
            name: hotel != null ? "${hotel!.name}" : '',
            desc: hotel != null ? "${hotel!.description}" : '',
            viewHotels: () {
              Navigator.pushNamed(
                context,
                AppRouterNames.rExploreLayoutRoute,
              );
            },
          ),
          HomeSliverAppBarSearchView(
            searchHotels: () {
              //TODO
            },
          ),
        ],
      ),
    );
  }
}
