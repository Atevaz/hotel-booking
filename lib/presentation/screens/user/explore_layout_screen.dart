import 'package:booking_hotel/core/router/app_router_names.dart';
import 'package:booking_hotel/core/styles/colors.dart';
import 'package:booking_hotel/business_logic/business_logic.dart';
import 'package:booking_hotel/data/model/facility_mode.dart';
import 'package:booking_hotel/presentation/screens/user/explore_screen.dart';
import 'package:booking_hotel/presentation/screens/user/search_map.dart';
import 'package:booking_hotel/presentation/view/explore_search_bar.dart';
import 'package:booking_hotel/presentation/view/my_app_bar.dart';
import 'package:booking_hotel/presentation/widget/medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExploreLayoutScreen extends StatelessWidget {
  const ExploreLayoutScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelCubit, HotelState>(
      builder: (context, state) {
        final hotelCubit = HotelCubit.get(context);
        bool searching = false;
        if (state is SearchHotelsLoadingState) {
          searching = true;
        }
        String? err;
        if (state is SearchHotelsLoadingErrorState) {
          err = state.message;
        }
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: AppBar().preferredSize,
            child: MyAppBar(
              title: "Explore",
              isBack: true,
              actions: [
                IconButton(
                  onPressed: hotelCubit.toggleSearchBar,
                  icon: Icon(
                    hotelCubit.showSearchBar ? Icons.close : Icons.search,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    hotelCubit.toggleCurrentExploreLayout();
                  },
                  icon: Icon(
                    hotelCubit.currentLayoutIndex == 0
                        ? Icons.map
                        : Icons.format_align_justify,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
              ],
            ),
          ),
          body: SafeArea(
            child: Stack(
              children: [
                Column(
                  children: [
                    ExploreSearchBar(
                      show: hotelCubit.showSearchBar,
                      cubit: hotelCubit,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: 20.w,
                              right: 20.w,
                              top: hotelCubit.currentLayoutIndex == 0 &&
                                      hotelCubit.showSearchBar
                                  ? 10.h
                                  : 0.h,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    MediumText(
                                      text:
                                          "${hotelCubit.searchHotels.length} ",
                                      fontSize: 20.sp,
                                    ),
                                    MediumText(
                                      text: "Hotel Found",
                                      fontSize: 20.sp,
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                    Navigator.pushNamed(
                                      context,
                                      AppRouterNames.rFilterLayoutRoute,
                                      arguments: [
                                        hotelCubit.facilities,
                                        hotelCubit.distanceFilter,
                                        hotelCubit.priceRangeFilter,
                                        hotelCubit.facilityListFilter,
                                      ],
                                    ).then((value) {
                                      final data = value as List<dynamic>;
                                      final priceR = data[0] as RangeValues?;
                                      final facilityList =
                                          data[1] as List<FacilityModel>?;
                                      final distance = data[2] as double?;
                                      hotelCubit.updateFilterData(
                                        priceR,
                                        distance,
                                        facilityList,
                                      );
                                    });
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      MediumText(
                                        text: "Filter",
                                        fontSize: 20.sp,
                                        color: AppColor.black,
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      const Icon(
                                        Icons.format_align_left,
                                        color: AppColor.teal,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: hotelCubit.currentLayoutIndex == 0
                                ? ExploreScreen(
                                    err: err,
                                    searching: searching,
                                  )
                                : SearchMapScreen(
                                    hotels: hotelCubit.searchHotels,
                                    searching: searching,
                                    err: err,
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
