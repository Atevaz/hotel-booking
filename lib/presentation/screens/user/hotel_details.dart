import 'package:booking_hotel/core/styles/colors.dart';
import 'package:booking_hotel/business_logic/booking_cubit/booking_cubit.dart';
import 'package:booking_hotel/data/model/hotel_model.dart';
import 'package:booking_hotel/presentation/widget/app_custom_rate_bar.dart';
import 'package:booking_hotel/presentation/widget/custom_button.dart';
import 'package:booking_hotel/presentation/widget/headline_text.dart';
import 'package:booking_hotel/presentation/widget/medium_text.dart';
import 'package:booking_hotel/presentation/widget/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HotelDetails extends StatelessWidget {
  const HotelDetails({
    super.key,
    this.bookingId,
    required this.hotel,
    required this.isBooking,
  });

  final int? bookingId;
  final HotelModel hotel;
  final bool isBooking;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookingCubit, BookingState>(
      listener: (context, state) {
        if (state is UpdateBookingSuccessState) {
          Navigator.pop(context);
          showToast(text: state.message, state: ToastStates.SUCCESS);
        }
        if (state is UpdateBookingErrorState) {
          Navigator.pop(context);
          showToast(text: state.message, state: ToastStates.ERROR);
        }
        if (state is CreateBookingSuccessState) {
          Navigator.pop(context);
          showToast(text: state.message, state: ToastStates.SUCCESS);
        }
        if (state is CreateBookingErrorState) {
          Navigator.pop(context);
          showToast(text: state.message, state: ToastStates.ERROR);
        }
      },
      builder: (context, state) {
        final cubit = BookingCubit.get(context);
        return Scaffold(
          body: Stack(
            children: [
              Image(
                image: NetworkImage(
                  hotel.hotelImages != null && hotel.hotelImages!.isNotEmpty
                      ? 'http://api.mahmoudtaha.com/images/${hotel.hotelImages![0].image}'
                      : "https://images.unsplash.com/photo-1529619768328-e37af76c6fe5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
                ),
                fit: BoxFit.cover,
                height: double.infinity,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: Theme.of(context).cardColor,
                    ),
                    padding: EdgeInsets.only(
                      top: 20.r,
                      right: 20.r,
                      left: 20.r,
                      bottom: 20.r,
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 11,
                              child: HeadLineText(
                                text: hotel.name,
                                maxLines: 2,
                              ),
                            ),
                            const Spacer(),
                            MediumText(
                              text: '${hotel.price}\$/night',
                              color: AppColor.grey,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        MediumText(
                          text: hotel.address,
                          color: AppColor.grey,
                        ),
                        Row(
                          children: [
                            AppCustomRateBar(rate: hotel.rate),
                            MediumText(
                              text: ' 80 Reviews',
                              color: Theme.of(context).textTheme.caption!.color,
                              fontSize: 16,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                    child: MyButton(
                        text: !isBooking ? 'Book now' : 'Cancelled Booking',
                        onPressed: () {
                          if (!isBooking) {
                            cubit.createBooking(hotel.id);
                          } else {
                            cubit.updateBooking(
                              bookingId!,
                              'cancelled',
                            );
                          }
                        }),
                  ),
                ],
              ),
              Positioned(
                top: 45.h,
                left: 12.w,
                child: Material(
                  color: Theme.of(context).cardColor,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  type: MaterialType.circle,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 8.0.w),
                      child: SizedBox(
                        width: 45.w,
                        height: 45.h,
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: AppColor.teal,
                          size: 25.r,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
