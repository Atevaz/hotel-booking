import 'package:booking_hotel/core/styles/colors.dart';
import 'package:booking_hotel/presentation/view/home_views/home_hotels_view.dart';
import 'package:booking_hotel/presentation/view/home_views/home_sliver_app_bar_view.dart';
import 'package:flutter/material.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.whitesMoke,
      body: CustomScrollView(
        slivers: [
          HomeSliverAppBarView(),
          HomeHotelsView(),
        ],
      ),
    );
  }
}
