import 'package:booking_hotel/business_logic/booking_cubit/booking_cubit.dart';
import 'package:booking_hotel/core/router/app_router_names.dart';
import 'package:booking_hotel/data/models/booking_model.dart';
import 'package:booking_hotel/data/models/hotel_data/hotel.dart';
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
                    condition: BookingCubit.get(context)
                        .upcomingBookingList
                        .isNotEmpty,
                    builder: (context) => Expanded(
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return HotelCard(
                            onTap: () => Navigator.pushNamed(
                              context,
                              AppRouterNames.rHotelDetailsLayoutRoute,
                              arguments: [
                                HotelModel(
                                  id: cubit
                                      .removeDuplicates(
                                          cubit.upcomingBookingList)[index]
                                      .id!,
                                  name: cubit
                                      .removeDuplicates(
                                          cubit.upcomingBookingList)[index]
                                      .hotel!
                                      .name!,
                                  desc: cubit
                                      .removeDuplicates(
                                          cubit.upcomingBookingList)[index]
                                      .hotel!
                                      .description!,
                                  price: double.parse(cubit
                                      .removeDuplicates(
                                          cubit.upcomingBookingList)[index]
                                      .hotel!
                                      .price!),
                                  address: cubit
                                      .removeDuplicates(
                                          cubit.upcomingBookingList)[index]
                                      .hotel!
                                      .address!,
                                  latitude: double.parse(cubit
                                      .removeDuplicates(
                                          cubit.upcomingBookingList)[index]
                                      .hotel!
                                      .latitude!),
                                  longitude: double.parse(cubit
                                      .removeDuplicates(
                                          cubit.upcomingBookingList)[index]
                                      .hotel!
                                      .longitude!),
                                  rate: double.parse(cubit
                                      .removeDuplicates(
                                          cubit.upcomingBookingList)[index]
                                      .hotel!
                                      .rate!),
                                  images: cubit
                                              .removeDuplicates(cubit
                                                  .upcomingBookingList)[index]
                                              .hotel!
                                              .hotelImages !=
                                          null
                                      ? cubit
                                          .removeDuplicates(
                                              cubit.upcomingBookingList)[index]
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
                                  facilities: cubit
                                              .removeDuplicates(cubit
                                                  .upcomingBookingList)[index]
                                              .hotel!
                                              .hotelFacilities !=
                                          null
                                      ? cubit
                                          .removeDuplicates(
                                              cubit.upcomingBookingList)[index]
                                          .hotel!
                                          .hotelFacilities!
                                          .map<FacilityModel>(
                                            (e) => FacilityModel(
                                              id: e.id!,
                                              name: '',
                                              image: '',
                                            ),
                                          )
                                          .toList()
                                      : <FacilityModel>[],
                                ),
                                BookingCubit.get(context)
                                    .removeDuplicates(BookingCubit.get(context)
                                        .upcomingBookingList)
                                    .any((element) =>
                                        element.hotelId ==
                                        BookingCubit.get(context)
                                            .removeDuplicates(
                                                BookingCubit.get(context)
                                                    .upcomingBookingList)[index]
                                            .hotelId)
                              ],
                            ),
                            image: BookingCubit.get(context)
                                    .removeDuplicates(BookingCubit.get(context)
                                        .upcomingBookingList)[index]
                                    .hotel!
                                    .hotelImages!
                                    .isNotEmpty
                                ? '${BookingCubit.get(context).removeDuplicates(BookingCubit.get(context).upcomingBookingList)[index].hotel!.hotelImages![0].image}'
                                : 'assets/images/hotel.jpg',
                            address:
                                '${BookingCubit.get(context).removeDuplicates(BookingCubit.get(context).upcomingBookingList)[index].hotel!.address}',
                            name:
                                '${BookingCubit.get(context).removeDuplicates(BookingCubit.get(context).upcomingBookingList)[index].hotel!.name}',
                            price: double.parse(
                                '${BookingCubit.get(context).removeDuplicates(BookingCubit.get(context).upcomingBookingList)[index].hotel!.price}'),
                            rate: double.parse(
                                '${BookingCubit.get(context).removeDuplicates(BookingCubit.get(context).upcomingBookingList)[index].hotel!.rate}'),
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(
                          height: 10.h,
                        ),
                        itemCount: BookingCubit.get(context)
                            .removeDuplicates(
                                BookingCubit.get(context).upcomingBookingList)
                            .length,
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
                        itemBuilder: (context, index) {
                          return HotelCard(
                            onTap: () => Navigator.pushNamed(
                              context,
                              AppRouterNames.rHotelDetailsLayoutRoute,
                              arguments: [
                                HotelModel(
                                  id: int.parse(cubit
                                      .removeDuplicates(
                                      cubit.completedBookingList)[index]
                                      .hotelId!),
                                  name: cubit
                                      .removeDuplicates(
                                          cubit.completedBookingList)[index]
                                      .hotel!
                                      .name!,
                                  desc: cubit
                                      .removeDuplicates(
                                          cubit.completedBookingList)[index]
                                      .hotel!
                                      .description!,
                                  price: double.parse(cubit
                                      .removeDuplicates(
                                          cubit.completedBookingList)[index]
                                      .hotel!
                                      .price!),
                                  address: cubit
                                      .removeDuplicates(
                                          cubit.completedBookingList)[index]
                                      .hotel!
                                      .address!,
                                  latitude: double.parse(cubit
                                      .removeDuplicates(
                                          cubit.completedBookingList)[index]
                                      .hotel!
                                      .latitude!),
                                  longitude: double.parse(cubit
                                      .removeDuplicates(
                                          cubit.completedBookingList)[index]
                                      .hotel!
                                      .longitude!),
                                  rate: double.parse(cubit
                                      .removeDuplicates(
                                          cubit.completedBookingList)[index]
                                      .hotel!
                                      .rate!),
                                  images: cubit
                                              .removeDuplicates(cubit
                                                  .completedBookingList)[index]
                                              .hotel!
                                              .hotelImages !=
                                          null
                                      ? cubit
                                          .removeDuplicates(
                                              cubit.completedBookingList)[index]
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
                                  facilities: cubit
                                              .removeDuplicates(cubit
                                                  .completedBookingList)[index]
                                              .hotel!
                                              .hotelFacilities !=
                                          null
                                      ? cubit
                                          .removeDuplicates(
                                              cubit.completedBookingList)[index]
                                          .hotel!
                                          .hotelFacilities!
                                          .map<FacilityModel>(
                                            (e) => FacilityModel(
                                              id: e.id!,
                                              name: '',
                                              image: '',
                                            ),
                                          )
                                          .toList()
                                      : <FacilityModel>[],
                                ),
                                false
                              ],
                            ),
                            image: BookingCubit.get(context)
                                    .removeDuplicates(BookingCubit.get(context)
                                        .completedBookingList)[index]
                                    .hotel!
                                    .hotelImages!
                                    .isNotEmpty
                                ? '${BookingCubit.get(context).removeDuplicates(BookingCubit.get(context).completedBookingList)[index].hotel!.hotelImages![0].image}'
                                : 'assets/images/hotel.jpg',
                            address:
                                '${BookingCubit.get(context).removeDuplicates(BookingCubit.get(context).completedBookingList)[index].hotel!.address}',
                            name:
                                '${BookingCubit.get(context).removeDuplicates(BookingCubit.get(context).completedBookingList)[index].hotel!.name}',
                            price: double.parse(
                                '${BookingCubit.get(context).removeDuplicates(BookingCubit.get(context).completedBookingList)[index].hotel!.price}'),
                            rate: double.parse(
                                '${BookingCubit.get(context).removeDuplicates(BookingCubit.get(context).completedBookingList)[index].hotel!.rate}'),
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(
                          height: 10.h,
                        ),
                        itemCount: BookingCubit.get(context)
                            .removeDuplicates(
                                BookingCubit.get(context).completedBookingList)
                            .length,
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
                        itemBuilder: (context, index) {
                          return HotelCard(
                            onTap: () => Navigator.pushNamed(
                              context,
                              AppRouterNames.rHotelDetailsLayoutRoute,
                              arguments: [
                                HotelModel(
                                  id: int.parse(cubit
                                      .removeDuplicates(
                                      cubit.cancelledBookingList)[index]
                                      .hotelId!),
                                  name: cubit
                                      .removeDuplicates(
                                          cubit.cancelledBookingList)[index]
                                      .hotel!
                                      .name!,
                                  desc: cubit
                                      .removeDuplicates(
                                          cubit.cancelledBookingList)[index]
                                      .hotel!
                                      .description!,
                                  price: double.parse(cubit
                                      .removeDuplicates(
                                          cubit.cancelledBookingList)[index]
                                      .hotel!
                                      .price!),
                                  address: cubit
                                      .removeDuplicates(
                                          cubit.cancelledBookingList)[index]
                                      .hotel!
                                      .address!,
                                  latitude: double.parse(cubit
                                      .removeDuplicates(
                                          cubit.cancelledBookingList)[index]
                                      .hotel!
                                      .latitude!),
                                  longitude: double.parse(cubit
                                      .removeDuplicates(
                                          cubit.cancelledBookingList)[index]
                                      .hotel!
                                      .longitude!),
                                  rate: double.parse(cubit
                                      .removeDuplicates(
                                          cubit.cancelledBookingList)[index]
                                      .hotel!
                                      .rate!),
                                  images: cubit
                                              .removeDuplicates(cubit
                                                  .cancelledBookingList)[index]
                                              .hotel!
                                              .hotelImages !=
                                          null
                                      ? cubit
                                          .removeDuplicates(
                                              cubit.cancelledBookingList)[index]
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
                                  facilities: cubit
                                              .removeDuplicates(cubit
                                                  .cancelledBookingList)[index]
                                              .hotel!
                                              .hotelFacilities !=
                                          null
                                      ? cubit
                                          .removeDuplicates(
                                              cubit.cancelledBookingList)[index]
                                          .hotel!
                                          .hotelFacilities!
                                          .map<FacilityModel>(
                                            (e) => FacilityModel(
                                              id: e.id!,
                                              name: '',
                                              image: '',
                                            ),
                                          )
                                          .toList()
                                      : <FacilityModel>[],
                                ),
                                false,
                              ],
                            ),
                            image: BookingCubit.get(context)
                                    .removeDuplicates(BookingCubit.get(context)
                                        .cancelledBookingList)[index]
                                    .hotel!
                                    .hotelImages!
                                    .isNotEmpty
                                ? '${BookingCubit.get(context).removeDuplicates(BookingCubit.get(context).cancelledBookingList)[index].hotel!.hotelImages![0].image}'
                                : 'assets/images/hotel.jpg',
                            address:
                                '${BookingCubit.get(context).removeDuplicates(BookingCubit.get(context).cancelledBookingList)[index].hotel!.address}',
                            name:
                                '${BookingCubit.get(context).removeDuplicates(BookingCubit.get(context).cancelledBookingList)[index].hotel!.name}',
                            price: double.parse(
                                '${BookingCubit.get(context).removeDuplicates(BookingCubit.get(context).cancelledBookingList)[index].hotel!.price}'),
                            rate: double.parse(
                                '${BookingCubit.get(context).removeDuplicates(BookingCubit.get(context).cancelledBookingList)[index].hotel!.rate}'),
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(
                          height: 10.h,
                        ),
                        itemCount: BookingCubit.get(context)
                            .removeDuplicates(
                                BookingCubit.get(context).cancelledBookingList)
                            .length,
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
