import 'package:booking_hotel/business_logic/booking_cubit/booking_cubit.dart';
import 'package:booking_hotel/core/router/app_router_names.dart';
import 'package:booking_hotel/data/models/booking_model.dart';
import 'package:booking_hotel/data/models/hotel_data/hotel.dart';
import 'package:booking_hotel/data/models/hotel_data/hotel_images.dart';
import 'package:booking_hotel/data/models/hotel_search_models_response/facility_model.dart';
import 'package:booking_hotel/data/models/hotel_search_models_response/hotel_image_model.dart';
import 'package:booking_hotel/data/models/hotel_search_models_response/hotel_model.dart';
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
                  if (loading && index == count - 1) {
                    item = const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {

  final isBooking = BookingCubit.get(context).removeDuplicates(BookingCubit.get(context).upcomingBookingList).any((element) => int.parse(element.hotelId!) == hotels[index].id);
                    print('adham ==========>>>>>> $isBooking');
                    final hotel = hotels[index];
                    final name = '${hotel.name}';
                    final image = hotel.hotelImages!.isNotEmpty
                        ? '${hotel.hotelImages![0].image}'
                        : '';
                    final price = double.parse(hotel.price!);
                    final rate = double.parse(hotel.rate!);
                    final location = '${hotel.address}';
                    final model = HotelModel(
                      id: !isBooking ? hotels[index].id! :BookingCubit.get(context).upcomingBookingList.firstWhere((e)=>int.parse(e.hotelId!) == hotels[index].id).id!,
                      name: hotel.name!,
                      desc: hotel.description!,
                      price: double.parse(hotel.price!),
                      address: hotel.address!,
                      latitude: double.parse(hotel.latitude!),
                      longitude: double.parse(hotel.longitude!),
                      rate: double.parse(hotel.rate!),
                      images: hotel.hotelImages != null
                          ? hotel.hotelImages!
                              .map(
                                (e) => HotelImageModel(
                                    id: e.id!,
                                    hotelId: int.parse(e.hotelId!),
                                    image: e.image!),
                              )
                              .toList()
                          : [],
                      facilities: hotel.hotelFacilities != null
                          ? hotel.hotelFacilities!
                              .map(
                                (e) => FacilityModel(
                                  id: e.id!,
                                  name: e.facilityId!,
                                  image: '',
                                ),
                              )
                              .toList()
                          : [],
                    );
                    item = HomeCardView(
                      name: name,
                      image: image,
                      price: price,
                      rate: rate,
                      location: location,
                      onTap: () => Navigator.pushNamed(
                        context,
                        AppRouterNames.rHotelDetailsLayoutRoute,
                        arguments: [
                        model,
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
