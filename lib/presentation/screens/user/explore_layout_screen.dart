import 'package:booking_hotel/business_logic/business_logic.dart';
import 'package:booking_hotel/core/di/di.dart';
import 'package:booking_hotel/core/router/app_router_names.dart';
import 'package:booking_hotel/core/styles/colors.dart';
import 'package:booking_hotel/data/models/hotel_search_models_response/facility_model.dart';
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
    return BlocProvider(
      create: (_) => sl<ExploreCubit>(),
      child: BlocBuilder<ExploreCubit, ExploreState>(
        builder: (context, state) {
          final explore = ExploreCubit.get(context);
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
                    onPressed: explore.toggleSearchBar,
                    icon: Icon(
                      explore.showSearchBar ? Icons.close : Icons.search,
                      color: AppColor.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      explore.toggleCurrentExploreLayout();
                    },
                    icon: Icon(
                      explore.currentLayoutIndex == 0
                          ? Icons.map
                          : Icons.format_align_justify,
                      color: AppColor.black,
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
                        explore: explore,
                        show: explore.showSearchBar,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: 20.w,
                                right: 20.w,
                                top: explore.currentLayoutIndex == 0 &&
                                        explore.showSearchBar
                                    ? 10.h
                                    : 0.h,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  MediumText(
                                    text:
                                        "${explore.searchHotels.length} Hotel Found",
                                    fontSize: 20.sp,
                                    color: AppColor.black,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                      Navigator.pushNamed(
                                        context,
                                        AppRouterNames.rFilterLayoutRoute,
                                        arguments: [
                                          explore.facilities,
                                          explore.distanceFilter,
                                          explore.priceRangeFilter,
                                          explore.facilityListFilter,
                                        ],
                                      ).then((value) {
                                        final data = value as List<dynamic>;
                                        final priceR = data[0] as RangeValues?;
                                        final facilityList =
                                            data[1] as List<FacilityModel>?;
                                        final distance = data[2] as double?;
                                        explore.updateFilterData(
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
                              child: explore.currentLayoutIndex == 0
                                  ? ExploreScreen(
                                      explore: explore,
                                      err: err,
                                      searching: searching,
                                    )
                                  : SearchMapScreen(
                                      hotels: explore.searchHotels,
                                      explore: explore,
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
      ),
    );
  }
}
