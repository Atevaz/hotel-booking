import 'package:booking_hotel/business_logic/booking_cubit/booking_cubit.dart';
import 'package:booking_hotel/core/router/app_router_names.dart';
import 'package:booking_hotel/data/models/hotel_search_models_response/facility_model.dart';
import 'package:booking_hotel/data/models/hotel_search_models_response/hotel_image_model.dart';
import 'package:booking_hotel/data/models/hotel_search_models_response/hotel_model.dart';
import 'package:booking_hotel/presentation/view/hotel_card.dart';
import 'package:booking_hotel/presentation/view/my_app_bar.dart';
import 'package:booking_hotel/presentation/view/toggle_booking_bar.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingCubit, BookingState>(
      builder: (context, state) {
        final cubit = BookingCubit.get(context);
        final selectedTabBatIndex = cubit.selectedBookingToggleTabBar;
        final upcomingCondition = cubit.upcommingBookingModel != null;
        final completedCondition = cubit.completedBookingModel != null;
        final canceledCondition = cubit.cancelledBookingModel != null;
        final upcoming = upcomingCondition
            ? cubit.upcommingBookingModel!.data!.dataList
            : [];
        final completed = completedCondition
            ? cubit.completedBookingModel!.data!.dataList
            : [];
        final canceled = canceledCondition
            ? cubit.cancelledBookingModel!.data!.dataList
            : [];
        return Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size(double.infinity, kToolbarHeight),
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
                if (selectedTabBatIndex == 0)
                  ConditionalBuilder(
                    condition: upcomingCondition,
                    builder: (context) => Expanded(
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => HotelCard(
                          onTap: () => Navigator.pushNamed(
                            context,
                            AppRouterNames.rHotelDetailsLayoutRoute,
                            arguments: HotelModel(
                              id: upcoming![index].id!,
                              name: upcoming[index].hotel!.name!,
                              desc: upcoming[index].hotel!.description!,
                              price:
                                  double.parse(upcoming[index].hotel!.price!),
                              address: upcoming[index].hotel!.address!,
                              latitude: double.parse(
                                  upcoming[index].hotel!.latitude!),
                              longitude: double.parse(
                                  upcoming[index].hotel!.longitude!),
                              rate: double.parse(upcoming[index].hotel!.rate!),
                              images: upcoming[index].hotel!.hotelImages != null
                                  ? upcoming[index]
                                      .hotel!
                                      .hotelImages!
                                      .map<HotelImageModel>(
                                        (e) => HotelImageModel(
                                          id: e.id!,
                                          hotelId: int.parse(e.hotelId!),
                                          image: e.image!,
                                        ),
                                      )
                                      .toList()
                                  : <HotelImageModel>[],
                              facilities:
                                  upcoming[index].hotel!.facilities != null
                                      ? upcoming[index]
                                          .hotel!
                                          .facilities!
                                          .map<FacilityModel>(
                                            (e) => FacilityModel(
                                              id: e.id!,
                                              name: e.name!,
                                              image: e.image!,
                                            ),
                                          )
                                          .toList()
                                      : <FacilityModel>[],
                            ),
                          ),
                          image: upcoming![index].hotel!.hotelImages!.isNotEmpty
                              ? '${upcoming[index].hotel!.hotelImages![0].image}'
                              : 'assets/images/hotel.jpg',
                          address: '${upcoming[index].hotel!.address}',
                          name: '${upcoming[index].hotel!.name}',
                          price:
                              double.parse('${upcoming[index].hotel!.price}'),
                          rate: double.parse('${upcoming[index].hotel!.rate}'),
                        ),
                        separatorBuilder: (context, index) => SizedBox(
                          height: 10.h,
                        ),
                        itemCount: upcoming!.length,
                      ),
                    ),
                    fallback: (context) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                if (cubit.selectedBookingToggleTabBar == 1)
                  ConditionalBuilder(
                    condition: completedCondition,
                    builder: (context) => Expanded(
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => HotelCard(
                          onTap: () => Navigator.pushNamed(
                            context,
                            AppRouterNames.rHotelDetailsLayoutRoute,
                            arguments: HotelModel(
                              id: completed![index].id!,
                              name: completed[index].hotel!.name!,
                              desc: completed[index].hotel!.description!,
                              price:
                                  double.parse(completed[index].hotel!.price!),
                              address: completed[index].hotel!.address!,
                              latitude: double.parse(
                                  completed[index].hotel!.latitude!),
                              longitude: double.parse(
                                  completed[index].hotel!.longitude!),
                              rate: double.parse(completed[index].hotel!.rate!),
                              images:
                                  completed[index].hotel!.hotelImages != null
                                      ? completed[index]
                                          .hotel!
                                          .hotelImages!
                                          .map<HotelImageModel>(
                                            (e) => HotelImageModel(
                                              id: e.id!,
                                              hotelId: int.parse(e.hotelId!),
                                              image: e.image!,
                                            ),
                                          )
                                          .toList()
                                      : <HotelImageModel>[],
                              facilities:
                                  completed[index].hotel!.facilities != null
                                      ? completed[index]
                                          .hotel!
                                          .facilities!
                                          .map<FacilityModel>(
                                            (e) => FacilityModel(
                                              id: e.id!,
                                              name: e.name!,
                                              image: e.image!,
                                            ),
                                          )
                                          .toList()
                                      : <FacilityModel>[],
                            ),
                          ),
                          image: completed![index]
                                  .hotel!
                                  .hotelImages!
                                  .isNotEmpty
                              ? '${completed[index].hotel!.hotelImages![0].image}'
                              : 'assets/images/hotel.jpg',
                          address: '${completed[index].hotel!.address}',
                          name: '${completed[index].hotel!.name}',
                          price:
                              double.parse('${completed[index].hotel!.price}'),
                          rate: double.parse('${completed[index].hotel!.rate}'),
                        ),
                        separatorBuilder: (context, index) => SizedBox(
                          height: 10.h,
                        ),
                        itemCount: completed!.length,
                      ),
                    ),
                    fallback: (context) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                if (cubit.selectedBookingToggleTabBar == 2)
                  ConditionalBuilder(
                    condition: canceledCondition,
                    builder: (context) => Expanded(
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => HotelCard(
                          onTap: () => Navigator.pushNamed(
                            context,
                            AppRouterNames.rHotelDetailsLayoutRoute,
                            arguments: HotelModel(
                              id: canceled![index].id!,
                              name: canceled[index].hotel!.name!,
                              desc: canceled[index].hotel!.description!,
                              price:
                                  double.parse(canceled[index].hotel!.price!),
                              address: canceled[index].hotel!.address!,
                              latitude: double.parse(
                                  canceled[index].hotel!.latitude!),
                              longitude: double.parse(
                                  canceled[index].hotel!.longitude!),
                              rate: double.parse(canceled[index].hotel!.rate!),
                              images: canceled[index].hotel!.hotelImages != null
                                  ? canceled[index]
                                      .hotel!
                                      .hotelImages!
                                      .map<HotelImageModel>(
                                        (e) => HotelImageModel(
                                          id: e.id!,
                                          hotelId: int.parse(e.hotelId!),
                                          image: e.image!,
                                        ),
                                      )
                                      .toList()
                                  : <HotelImageModel>[],
                              facilities:
                                  canceled[index].hotel!.facilities != null
                                      ? canceled[index]
                                          .hotel!
                                          .facilities!
                                          .map<FacilityModel>(
                                            (e) => FacilityModel(
                                              id: e.id!,
                                              name: e.name!,
                                              image: e.image!,
                                            ),
                                          )
                                          .toList()
                                      : <FacilityModel>[],
                            ),
                          ),
                          image: cubit
                                  .cancelledBookingModel!
                                  .data!
                                  .dataList![index]
                                  .hotel!
                                  .hotelImages!
                                  .isNotEmpty
                              ? '${cubit.cancelledBookingModel!.data!.dataList![index].hotel!.hotelImages![0].image}'
                              : 'assets/images/hotel.jpg',
                          address:
                              '${cubit.cancelledBookingModel!.data!.dataList![index].hotel!.address}',
                          name:
                              '${cubit.cancelledBookingModel!.data!.dataList![index].hotel!.name}',
                          price: double.parse(
                              '${cubit.cancelledBookingModel!.data!.dataList![index].hotel!.price}'),
                          rate: double.parse(
                              '${cubit.cancelledBookingModel!.data!.dataList![index].hotel!.rate}'),
                        ),
                        separatorBuilder: (context, index) => SizedBox(
                          height: 10.h,
                        ),
                        itemCount: canceled!.length,
                      ),
                    ),
                    fallback: (context) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
