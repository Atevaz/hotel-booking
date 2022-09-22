import 'package:booking_hotel/business_logic/business_logic.dart';
import 'package:booking_hotel/core/router/app_router_names.dart';
import 'package:booking_hotel/core/styles/colors.dart';
import 'package:booking_hotel/data/models/hotel_search_models_response/hotel_model.dart';
import 'package:booking_hotel/presentation/view/home_views/home_card_view.dart';
import 'package:booking_hotel/presentation/widget/custom_button.dart';
import 'package:booking_hotel/presentation/widget/medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchMapScreen extends StatelessWidget {
  const SearchMapScreen({
    Key? key,
    required this.hotels,
    required this.explore,
    this.err,
    required this.searching,
  }) : super(key: key);

  final List<HotelModel> hotels;
  final String? err;
  final ExploreCubit explore;
  final bool searching;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        explore.myLocation != null
            ? Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Expanded(
                    child: GoogleMap(
                      zoomControlsEnabled: false,
                      mapToolbarEnabled: false,
                      markers: explore.markers,
                      mapType: MapType.normal,
                      initialCameraPosition: explore.initialPosition,
                      onMapCreated: explore.onCreateMap,
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
                          explore.getMyLocation();
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
              onTap: () => explore.goToNewPosition(
                explore.myLocation!.latitude,
                explore.myLocation!.longitude,
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
            child: err == null
                ? ListView.separated(
                    controller: explore.listC,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      if (index == explore.hotels.length) {
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
                          image: hotels[index].images.isNotEmpty
                              ? hotels[index].images[0].image
                              : "",
                          name: hotels[index].name,
                          address: hotels[index].address,
                          location: hotels[index].address,
                          rate: hotels[index].rate,
                          price: hotels[index].price,
                          onDoubleTap: () => explore.goToNewPosition(
                            hotels[index].latitude,
                            hotels[index].longitude,
                          ),
                          onTap: () => Navigator.pushNamed(
                            context,
                            AppRouterNames.rHotelDetailsLayoutRoute,
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                      width: 10.w,
                    ),
                    itemCount: searching ? hotels.length + 1 : hotels.length,
                  )
                : Center(
                    child: Container(
                      width: double.infinity,
                      height: 100.h,
                      margin: EdgeInsets.symmetric(horizontal: 20.w),
                      color: AppColor.white,
                      child: Center(
                        child: MediumText(
                          text: err!,
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
