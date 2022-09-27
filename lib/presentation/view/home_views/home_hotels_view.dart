import 'package:booking_hotel/business_logic/booking_cubit/booking_cubit.dart';
import 'package:booking_hotel/core/router/app_router_names.dart';
import 'package:booking_hotel/data/models/booking_model.dart';
import 'package:booking_hotel/data/models/hotel_data/hotel.dart';
import 'package:booking_hotel/data/models/hotel_data/hotel_images.dart';
import 'package:booking_hotel/data/models/hotel_search_models_response/facility_model.dart';
import 'package:booking_hotel/data/models/hotel_search_models_response/hotel_image_model.dart';
import 'package:booking_hotel/data/models/hotel_search_models_response/hotel_model.dart';
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

                    final isBooking = BookingCubit.get(context).removeDuplicates(BookingCubit.get(context).upcomingBookingList).any((element) => int.parse(element.hotelId!) == hotels[index-1].id);
                    print('adham ==========>>>>>> $isBooking');
                        item = HomeCardView(
                      name: '${hotels[index-1].name}',
                      image: hotels[index - 1].hotelImages!.isNotEmpty
                          ? '${hotels[index - 1].hotelImages![0].image}'
                          : '',
                      price: double.parse(hotels[index - 1].price!),
                      rate: double.parse(hotels[index - 1].rate!),
                      location: '${hotels[index - 1].address}',
                      onTap: () => Navigator.pushNamed(
                        context,
                        AppRouterNames.rHotelDetailsLayoutRoute,
                        // arguments: DataList(
                        //   id: hotels[index].id!,
                        //   hotel: Hotel(
                        //     id: hotels[index].id!,
                        //     name: hotels[index].name!,
                        //     description: hotels[index].description!,
                        //     price: hotels[index].price!,
                        //     address:  hotels[index].address!,
                        //     latitude: hotels[index].latitude!,
                        //     longitude: hotels[index].longitude!,
                        //     rate: hotels[index].rate!,
                        //     hotelImages: hotels[index].hotelImages != null
                        //         ? hotels[index]
                        //         .hotelImages!
                        //         .map(
                        //           (e) => HotelImages(
                        //           id: e.id!,
                        //           hotelId:e.hotelId!,
                        //           image: e.image!),
                        //     )
                        //         .toList()
                        //         : [],
                        //     facilities: hotels[index].hotelFacilities != null
                        //         ? hotels[index]
                        //         .hotelFacilities!
                        //         .map(
                        //           (e) => FacilityModel(
                        //         id: e.id!,
                        //         name: e.facilityId!,
                        //         image: '',
                        //       ),
                        //     )
                        //         .toList()
                        //         : [],
                        //   ) ,
                        // ),
                        arguments: [
                          HotelModel(
                            id: !isBooking ? hotels[index-1].id! :BookingCubit.get(context).upcomingBookingList.firstWhere((e)=>int.parse(e.hotelId!) == hotels[index-1].id).id!,
                            name: hotels[index-1].name!,
                            desc: hotels[index-1].description!,
                            price: double.parse(hotels[index-1].price!),
                            address: hotels[index-1].address!,
                            latitude: double.parse(hotels[index-1].latitude!),
                            longitude: double.parse(hotels[index-1].longitude!),
                            rate: double.parse(hotels[index-1].rate!),
                            images: hotels[index-1].hotelImages != null
                                ? hotels[index-1]
                                .hotelImages!
                                .map(
                                  (e) => HotelImageModel(
                                  id: e.id!,
                                  hotelId: int.parse(e.hotelId!),
                                  image: e.image!),
                            )
                                .toList()
                                : [],
                            facilities: hotels[index-1].hotelFacilities != null
                                ? hotels[index-1]
                                .hotelFacilities!
                                .map(
                                  (e) => FacilityModel(
                                id: e.id!,
                                name: e.facilityId!,
                                image: '',
                              ),
                            )
                                .toList()
                                : [],
                          ),
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
