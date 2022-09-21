import 'package:booking_hotel/core/router/app_router_names.dart';
import 'package:booking_hotel/presentation/view/hotel_card.dart';
import 'package:booking_hotel/presentation/view/my_app_bar.dart';
import 'package:booking_hotel/presentation/view/toggle_booking_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, kToolbarHeight),
        child: MyAppBar(
          isCompletedAppBar: false,
          isBack: false,
          title: 'My Trips',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          children: [
            const ToggleTabBar(),
            SizedBox(
              height: 10.h,
            ),
            HotelCard(
              onTap: () => Navigator.pushNamed(
                  context, AppRouterNames.rHotelDetailsLayoutRoute),
            ),
          ],
        ),
      ),
    );
  }
}
