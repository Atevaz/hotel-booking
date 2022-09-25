import 'package:booking_hotel/business_logic/booking_cubit/booking_cubit.dart';
import 'package:booking_hotel/core/router/app_router_names.dart';
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
    return BlocConsumer<BookingCubit, BookingState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
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
                if(BookingCubit.get(context).selectedBookingToggleTabBar == 0 )
                  ConditionalBuilder(
                  condition: BookingCubit.get(context).upcommingBookingModel != null  ,
                  builder: (context) => Expanded(
                    child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) => HotelCard(
                        onTap: () => Navigator.pushNamed(
                            context, AppRouterNames.rHotelDetailsLayoutRoute),
                        image: BookingCubit.get(context).upcommingBookingModel!.data!.dataList![index].hotel!.hotelImages!.isNotEmpty ?'${BookingCubit.get(context).upcommingBookingModel!.data!.dataList![index].hotel!.hotelImages![0].image}' : 'assets/images/hotel.jpg',
                        address: '${BookingCubit.get(context).upcommingBookingModel!.data!.dataList![index].hotel!.address}',
                        name: '${BookingCubit.get(context).upcommingBookingModel!.data!.dataList![index].hotel!.name}',
                        price: double.parse('${BookingCubit.get(context).upcommingBookingModel!.data!.dataList![index].hotel!.price}'),
                        rate: double.parse('${BookingCubit.get(context).upcommingBookingModel!.data!.dataList![index].hotel!.rate}'),
                      ),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 10.h,
                      ),
                      itemCount: BookingCubit.get(context).upcommingBookingModel!.data!.dataList!.length,
                    ),
                  ),
                  fallback: (context) => const Center(child: CircularProgressIndicator(),) ,

                ),
                if(BookingCubit.get(context).selectedBookingToggleTabBar == 1 )
                  ConditionalBuilder(
                    condition: BookingCubit.get(context).completedBookingModel != null  ,
                    builder: (context) => Expanded(
                      child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) => HotelCard(
                          onTap: () => Navigator.pushNamed(
                              context, AppRouterNames.rHotelDetailsLayoutRoute),
                          image: BookingCubit.get(context).completedBookingModel!.data!.dataList![index].hotel!.hotelImages!.isNotEmpty ?'${BookingCubit.get(context).completedBookingModel!.data!.dataList![index].hotel!.hotelImages![0].image}' : 'assets/images/hotel.jpg',
                          address: '${BookingCubit.get(context).completedBookingModel!.data!.dataList![index].hotel!.address}',
                          name: '${BookingCubit.get(context).completedBookingModel!.data!.dataList![index].hotel!.name}',
                          price: double.parse('${BookingCubit.get(context).completedBookingModel!.data!.dataList![index].hotel!.price}'),
                          rate: double.parse('${BookingCubit.get(context).completedBookingModel!.data!.dataList![index].hotel!.rate}'),
                        ),
                        separatorBuilder: (context, index) => SizedBox(
                          height: 10.h,
                        ),
                        itemCount: BookingCubit.get(context).completedBookingModel!.data!.dataList!.length,
                      ),
                    ),
                    fallback: (context) => const Center(child: CircularProgressIndicator(),) ,

                  ),
                if(BookingCubit.get(context).selectedBookingToggleTabBar == 2 )
                  ConditionalBuilder(
                    condition: BookingCubit.get(context).cancelledBookingModel != null  ,
                    builder: (context) => Expanded(
                      child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) => HotelCard(
                          onTap: () => Navigator.pushNamed(
                              context, AppRouterNames.rHotelDetailsLayoutRoute),
                          image: BookingCubit.get(context).cancelledBookingModel!.data!.dataList![index].hotel!.hotelImages!.isNotEmpty ?'${BookingCubit.get(context).cancelledBookingModel!.data!.dataList![index].hotel!.hotelImages![0].image}' : 'assets/images/hotel.jpg',
                          address: '${BookingCubit.get(context).cancelledBookingModel!.data!.dataList![index].hotel!.address}',
                          name: '${BookingCubit.get(context).cancelledBookingModel!.data!.dataList![index].hotel!.name}',
                          price: double.parse('${BookingCubit.get(context).cancelledBookingModel!.data!.dataList![index].hotel!.price}'),
                          rate: double.parse('${BookingCubit.get(context).cancelledBookingModel!.data!.dataList![index].hotel!.rate}'),
                        ),
                        separatorBuilder: (context, index) => SizedBox(
                          height: 10.h,
                        ),
                        itemCount: BookingCubit.get(context).cancelledBookingModel!.data!.dataList!.length,
                      ),
                    ),
                    fallback: (context) => const Center(child: CircularProgressIndicator(),) ,

                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
