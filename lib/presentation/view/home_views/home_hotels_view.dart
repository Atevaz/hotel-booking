import 'package:booking_hotel/core/router/app_router_names.dart';
import 'package:booking_hotel/data/models/hotel_data/hotel.dart';
import 'package:booking_hotel/presentation/view/home_views/home_card_view.dart';
import 'package:booking_hotel/presentation/view/home_views/home_hotel_headline_view.dart';
import 'package:booking_hotel/presentation/widget/medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeHotelsView extends StatelessWidget {
  const HomeHotelsView({
    Key? key,
    this.err,
    this.loading = false,
    required this.count,
    required this.hotels,
  }) : super(key: key);

  final String? err;
  final bool loading;
  final int count;
  final List<Hotel> hotels;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 15.h,
      ),
      sliver: err != null
          ? SliverFillRemaining(
              child: Center(
                child: MediumText(
                  text: err!,
                  color: Colors.red,
                ),
              ),
            )
          : SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  EdgeInsets insets = EdgeInsets.zero;
                  Widget item = Container();
                  if (index != count - 1) {
                    insets = EdgeInsets.only(bottom: 25.h);
                  }
                  if (index == 0) {
                    item = HomeHotelsHeadlineView(
                      viewAll: () {
                        Navigator.pushNamed(
                            context, AppRouterNames.rExploreLayoutRoute);
                      },
                    );
                  } else if (loading && index == count - 1) {
                    item = const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    item = HomeCardView(
                      name: '${hotels[index - 1].name}',
                      image: hotels[index - 1].hotelImages!.isNotEmpty
                          ? '${hotels[index - 1].hotelImages![0].image}'
                          : '',
                      price: double.parse(hotels[index - 1].price!),
                      rate: double.parse(hotels[index - 1].rate!),
                      location: '${hotels[index - 1].address}',
                      onTap: () => Navigator.pushNamed(
                          context, AppRouterNames.rHotelDetailsLayoutRoute),
                    );
                  }
                  return Padding(
                    padding: insets,
                    child: item,
                  );
                },
                childCount: count,
              ),
            ),
    );
  }
}
