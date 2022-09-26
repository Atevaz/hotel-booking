import 'package:booking_hotel/business_logic/booking_cubit/booking_cubit.dart';
import 'package:booking_hotel/core/styles/colors.dart';
import 'package:booking_hotel/data/models/hotel_search_models_response/hotel_model.dart';
import 'package:booking_hotel/presentation/widget/app_custom_rate_bar.dart';
import 'package:booking_hotel/presentation/widget/custom_button.dart';
import 'package:booking_hotel/presentation/widget/headline_text.dart';
import 'package:booking_hotel/presentation/widget/medium_text.dart';
import 'package:booking_hotel/presentation/widget/regular_text.dart';
import 'package:booking_hotel/presentation/widget/review_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HotelDetails extends StatefulWidget {
  const HotelDetails({super.key, required this.hotel});

  final HotelModel hotel;

  @override
  State<HotelDetails> createState() => _HotelDetailsState();
}

class _HotelDetailsState extends State<HotelDetails> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookingCubit, BookingState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image(
                    image: NetworkImage(
                      widget.hotel.images.isNotEmpty
                          ? 'http://api.mahmoudtaha.com/images/${widget.hotel.images[0].image}'
                          : 'http://api.mahmoudtaha.com/images/83631662902917.png',
                    ),
                    fit: BoxFit.cover,
                    height: 300.h,
                    width: double.infinity,
                  ),
                  Positioned(
                    top: 40.h,
                    left: 20.w,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: CircleAvatar(
                          backgroundColor: AppColor.white.withOpacity(.8),
                          radius: 25.r,
                          child: Padding(
                            padding: EdgeInsets.only(left: 8.0.w),
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: AppColor.teal,
                              size: 25.r,
                            ),
                          )),
                    ),
                  ),
                ],
              ),
              Container(
                color: AppColor.lightGrey,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 20.r, right: 20.r, left: 20.r, bottom: 20.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 11,
                            child: HeadLineText(
                              text: widget.hotel.name,
                              maxLines: 2,
                            ),
                          ),
                          const Spacer(),
                          RegularText(
                            text: '${widget.hotel.price.toInt()}\$/night',
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      MediumText(
                        text: widget.hotel.address,
                        color: AppColor.grey,
                      ),
                      Row(
                        children: [
                          AppCustomRateBar(rate: widget.hotel.rate),
                          const RegularText(text: ' 80 Reviews')
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(20.r),
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => const ReviewWidget(),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 25.h,
                      ),
                      itemCount: 6,
                    ),
                  ),
                ),
              ),
            ],
          ),
          floatingActionButton: Padding(
            padding: EdgeInsets.only(left: 35.0.r),
            child: MyButton(
              text: 'Book now',
              onPressed: () {
                BookingCubit.get(context).createBooking(widget.hotel.id);
              },
            ),
          ),
        );
      },
    );
  }
}
