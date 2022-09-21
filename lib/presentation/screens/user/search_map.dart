import 'dart:async';
import 'dart:collection';

import 'package:booking_hotel/core/styles/colors.dart';
import 'package:booking_hotel/presentation/view/home_views/home_card_view.dart';
import 'package:booking_hotel/presentation/view/home_views/home_hotels_view.dart';
import 'package:booking_hotel/presentation/view/my_app_bar.dart';
import 'package:booking_hotel/presentation/widget/default_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchMapScreen extends StatefulWidget {
  const SearchMapScreen({Key? key}) : super(key: key);

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(31.1,30.1),
    zoom: 12,
  );

  @override
  State<SearchMapScreen> createState() => _SearchMapScreenState();
}

class _SearchMapScreenState extends State<SearchMapScreen> {
  Completer<GoogleMapController> _controller = Completer();

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
            Icon(Icons.favorite_border_rounded),
            SizedBox(
              width: 10.w,
            ),
            Icon(Icons.menu),
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
                markers.add(Marker(
                  markerId: MarkerId('1'),
                  position: LatLng(31.1,30.30),
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
                  Container(
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
                        child: Icon(
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
              child: Container(
                  width: 400.w,
                  height: 150.h,
                  child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Container(
                            width: 345,
                            child: HomeCardView(onTap: () {},),
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
