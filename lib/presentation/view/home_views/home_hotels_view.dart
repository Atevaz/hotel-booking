import 'package:booking_hotel/core/router/app_router_names.dart';
import 'package:booking_hotel/business_logic/booking_cubit/booking_cubit.dart';
import 'package:booking_hotel/data/model/hotel_model.dart';
import 'package:booking_hotel/presentation/view/home_views/home_card_view.dart';
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
    required this.cubit,
  }) : super(key: key);

  final BookingCubit cubit;
  final String? err;
  final bool loading;
  final int count;
  final List<HotelModel> hotels;

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
                  if (loading && index == count - 1) {
                    item = const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    final isBooking = cubit.upcomingBookingList
                        .any((element) => element.hotelId == hotels[index].id);
                    final bookingId = isBooking
                        ? cubit.upcomingBookingList
                            .firstWhere(
                              (element) => element.hotel.id == hotels[index].id,
                            )
                            .id
                        : null;
                    final hotel = hotels[index];
                    item = HomeCardView(
                      name: hotel.name,
                      address: hotel.address,
                      image: hotel.hotelImages != null &&
                              hotel.hotelImages!.isNotEmpty
                          ? hotel.hotelImages![0].image
                          : '',
                      price: hotel.price,
                      rate: hotel.rate,
                      location: hotel.address,
                      onTap: () => Navigator.pushNamed(
                        context,
                        AppRouterNames.rHotelDetailsLayoutRoute,
                        arguments: [
                          bookingId,
                          hotel,
                          isBooking,
                        ],
                      ),
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
