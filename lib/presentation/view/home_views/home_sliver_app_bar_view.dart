import 'package:booking_hotel/presentation/view/home_views/home_sliver_app_bar_background_view.dart';
import 'package:booking_hotel/presentation/view/home_views/home_sliver_app_bar_image_view.dart';
import 'package:booking_hotel/presentation/view/home_views/home_sliver_app_bar_search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeSliverAppBarView extends StatefulWidget {
  const HomeSliverAppBarView({Key? key}) : super(key: key);

  @override
  State<HomeSliverAppBarView> createState() => _HomeSliverAppBarViewState();
}

class _HomeSliverAppBarViewState extends State<HomeSliverAppBarView> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      pinned: true,
      floating: true,
      expandedHeight: 500.h,
      bottom: PreferredSize(
        preferredSize: Size(double.infinity.w, 150.h),
        child: Container(),
      ),
      flexibleSpace: Stack(
        children: const [
          HomeSliverAppBarImageView(),
          HomeSliverAppBarBackgroundView(),
          HomeSliverAppBarSearchView(),
        ],
      ),
    );
  }
}
