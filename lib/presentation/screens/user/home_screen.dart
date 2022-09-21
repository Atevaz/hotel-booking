import 'package:booking_hotel/presentation/view/home_views/home_hotels_view.dart';
import 'package:booking_hotel/presentation/view/home_views/home_sliver_app_bar_view.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:  [
        CustomScrollView(
          slivers: [
            //TODO create page view with indicator
            HomeSliverAppBarView(),
            HomeHotelsView(),
          ],
        ),
      ],
    );
  }
}
