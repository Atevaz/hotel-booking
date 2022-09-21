import 'package:booking_hotel/core/router/app_router_names.dart';
import 'package:booking_hotel/presentation/view/home_views/home_card_view.dart';
import 'package:booking_hotel/presentation/view/home_views/home_hotel_headline_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeHotelsView extends StatelessWidget {
  const HomeHotelsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 15.h,
      ),
      sliver: SliverAnimatedList(
        initialItemCount: 11,
        itemBuilder: (_, index, anim) {
          EdgeInsets insets = EdgeInsets.zero;
          Widget item = HomeCardView(
            onTap: () {
              /// routing
            },
          );
          if (index != 10) {
            insets = EdgeInsets.only(bottom: 25.h);
          }
          if (index == 0) {
            item = HomeHotelsHeadlineView(
              viewAll: () {
                Navigator.pushNamed(context, AppRouterNames.rExploreLayoutRoute);
              },
            );
          }
          return Padding(
            padding: insets,
            child: item,
          );
        },
      ),
    );
  }
}
