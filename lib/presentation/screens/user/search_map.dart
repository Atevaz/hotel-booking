import 'package:booking_hotel/core/router/app_router_names.dart';
import 'package:booking_hotel/core/styles/colors.dart';
import 'package:booking_hotel/business_logic/business_logic.dart';
import 'package:booking_hotel/data/model/hotel_model.dart';
import 'package:booking_hotel/presentation/view/home_views/home_card_view.dart';
import 'package:booking_hotel/presentation/widget/custom_button.dart';
import 'package:booking_hotel/presentation/widget/medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchMapScreen extends StatefulWidget {
  const SearchMapScreen({
    Key? key,
    required this.hotels,
    this.err,
    required this.searching,
  }) : super(key: key);

  final List<HotelModel> hotels;
  final String? err;
  final bool searching;

  @override
  State<SearchMapScreen> createState() => _SearchMapScreenState();
}

class _SearchMapScreenState extends State<SearchMapScreen> {
  late String _mapStyle;

  @override
  void initState() {
    super.initState();
    rootBundle.loadString('assets/json/1.txt').then((string) {
      _mapStyle = string;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cubit = HotelCubit.get(context);
    return Stack(
      children: [
        cubit.myLocation != null
            ? Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Expanded(
                    child: GoogleMap(
                      zoomControlsEnabled: false,
                      mapToolbarEnabled: false,
                      markers: cubit.markers,
                      mapType: MapType.normal,
                      initialCameraPosition: cubit.initialPosition,
                      onMapCreated: (controller) {
                        cubit.onCreateMap(controller);
                        if (GlobalCubit.get(context).isDark) {
                          controller.setMapStyle(_mapStyle);
                        }
                      },
                    ),
                  ),
                ],
              )
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const MediumText(
                        textAlign: TextAlign.center,
                        text: "Location must be granted to view Map",
                        color: Colors.red,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      MyButton(
                        onPressed: () {
                          cubit.getMyLocation();
                        },
                        text: "Get My Location",
                      ),
                    ],
                  ),
                ),
              ),
        Positioned(
          bottom: 150,
          right: 10,
          child: Material(
            type: MaterialType.circle,
            color: AppColor.teal,
            clipBehavior: Clip.hardEdge,
            child: InkWell(
              onTap: () => cubit.goToNewPosition(
                cubit.myLocation!.latitude,
                cubit.myLocation!.longitude,
              ),
              child: Padding(
                padding: EdgeInsets.all(10.r),
                child: const Icon(
                  Icons.location_searching,
                  color: AppColor.white,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 10.h,
          left: 10.w,
          child: SizedBox(
            width: 400.w,
            height: 150.h,
            child: widget.err == null
                ? ListView.separated(
                    controller: cubit.searchListC,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final isBooking = BookingCubit.get(context)
                          .upcomingBookingList
                          .any((element) =>
                              element.hotelId == cubit.searchHotels[index].id);

                      if (index == cubit.searchHotels.length) {
                        return const Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                      return SizedBox(
                        width: 345,
                        child: HomeCardView(
                          image: widget.hotels[index].hotelImages != null &&
                                  widget.hotels[index].hotelImages!.isNotEmpty
                              ? widget.hotels[index].hotelImages![0].image
                              : "",
                          name: widget.hotels[index].name,
                          address: widget.hotels[index].address,
                          location: widget.hotels[index].address,
                          rate: widget.hotels[index].rate,
                          price: widget.hotels[index].price,
                          onDoubleTap: () => cubit.goToNewPosition(
                            widget.hotels[index].latitude,
                            widget.hotels[index].longitude,
                          ),
                          onTap: () {
                            final bookingId = isBooking
                                ? BookingCubit.get(context)
                                    .upcomingBookingList
                                    .firstWhere((e) =>
                                        e.hotelId ==
                                        cubit.searchHotels[index].id)
                                    .id
                                : null;
                            final hotel = cubit.searchHotels[index];
                            Navigator.pushNamed(
                              context,
                              AppRouterNames.rHotelDetailsLayoutRoute,
                              arguments: [
                                bookingId,
                                hotel,
                                isBooking,
                              ],
                            );
                          },
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                      width: 10.w,
                    ),
                    itemCount: widget.searching
                        ? widget.hotels.length + 1
                        : widget.hotels.length,
                  )
                : Center(
                    child: Container(
                      width: double.infinity,
                      height: 100.h,
                      margin: EdgeInsets.symmetric(horizontal: 20.w),
                      color: AppColor.white,
                      child: Center(
                        child: MediumText(
                          textAlign: TextAlign.center,
                          text: widget.err!,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
