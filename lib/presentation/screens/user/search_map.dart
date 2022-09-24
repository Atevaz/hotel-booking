import 'dart:async';
import 'dart:collection';
import 'package:booking_hotel/core/router/app_router_names.dart';
import 'package:booking_hotel/core/styles/colors.dart';
import 'package:booking_hotel/presentation/view/home_views/home_card_view.dart';
import 'package:booking_hotel/presentation/view/my_app_bar.dart';
import 'package:booking_hotel/presentation/widget/default_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchMapScreen extends StatefulWidget {
  const SearchMapScreen({Key? key}) : super(key: key);

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(31.1, 30.1),
    zoom: 12,
  );

  @override
  State<SearchMapScreen> createState() => _SearchMapScreenState();
}

class _SearchMapScreenState extends State<SearchMapScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  var markers = HashSet<Marker>();
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, kToolbarHeight),
        child: MyAppBar(
          isBack: true,
          title: 'Search',
          actions: [
            const Icon(Icons.favorite_border_rounded),
            SizedBox(
              width: 10.w,
            ),
            const Icon(Icons.menu),
            SizedBox(
              width: 10.w,
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            zoomControlsEnabled: false,
            mapToolbarEnabled: false,
            markers: markers,
            mapType: MapType.normal,
            initialCameraPosition: SearchMapScreen._kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              setState(() {
                markers.add(const Marker(
                  markerId: MarkerId('1'),
                  position: LatLng(53.909500999080755, -2.7780570134925746),
                ));
              });
            },
          ),
          Positioned(
            top: 10.h,
            child: Padding(
              padding: EdgeInsets.only(left: 5.w),
              child: Row(
                children: [
                  SizedBox(
                      width: 340.w,
                      height: 65.h,
                      child: MyFormField(
                        controller: searchController,
                        validateText: '',
                        inputType: TextInputType.text,
                        hintText: 'Search',
                        borderRadius: 40.r,
                      )),
                  SizedBox(
                    width: 5.w,
                  ),
                  InkWell(
                    onTap: () {
                      /// todo function search here
                    },
                    child: CircleAvatar(
                        backgroundColor: AppColor.teal,
                        radius: 30.r,
                        child: const Icon(
                          Icons.search,
                          color: AppColor.white,
                        )),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 10.h,
              left: 10.w,
              child: SizedBox(
                  width: 400.w,
                  height: 150.h,
                  child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => SizedBox(
                            width: 345,
                            child: HomeCardView(
                              onTap: () => Navigator.pushNamed(context,
                                  AppRouterNames.rHotelDetailsLayoutRoute),
                            ),
                          ),
                      separatorBuilder: (context, index) => SizedBox(
                            width: 10.w,
                          ),
                      itemCount: 10))),
        ],
      ),
    );
  }
}
