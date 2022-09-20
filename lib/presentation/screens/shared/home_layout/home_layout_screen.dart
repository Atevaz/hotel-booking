import 'package:booking_hotel/core/styles/colors.dart';
import 'package:booking_hotel/presentation/view/bottom_navigation_bar.dart';
import 'package:booking_hotel/presentation/view/home_views/home_hotels_view.dart';
import 'package:booking_hotel/presentation/view/home_views/home_sliver_app_bar_view.dart';
import 'package:flutter/material.dart';

class HomeLayoutScreen extends StatelessWidget {
  const HomeLayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      backgroundColor: AppColor.lightGrey,
      body: Stack(
        children: const [
          CustomScrollView(
            slivers: [
              //TODO create page view with indicator
              HomeSliverAppBarView(),
              HomeHotelsView(),
            ],
          ),
        ],
      ),
    );
  }
}
