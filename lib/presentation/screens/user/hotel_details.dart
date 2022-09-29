import 'package:booking_hotel/business_logic/business_logic.dart';
import 'package:booking_hotel/core/styles/colors.dart';
import 'package:booking_hotel/business_logic/booking_cubit/booking_cubit.dart';
import 'package:booking_hotel/data/model/hotel_model.dart';
import 'package:booking_hotel/presentation/view/hotel_less_details_view.dart';
import 'package:booking_hotel/presentation/view/hotel_more_details_view.dart';
import 'package:booking_hotel/presentation/widget/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HotelDetails extends StatefulWidget {
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
  State<HotelDetails> createState() => _HotelDetailsState();
}

class _HotelDetailsState extends State<HotelDetails>
    with TickerProviderStateMixin {
  ValueNotifier<bool> show = ValueNotifier(false);
  final double minO = 0;
  final double maxO = 1;
  late AnimationController _expandAnimationController;
  late AnimationController _collapseAnimationController;
  late Animation<double> _expandAnimation;
  late Animation<double> _collapseAnimation;

  @override
  void initState() {
    super.initState();
    _expandAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _collapseAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _expandAnimation = Tween(
      begin: 1.0,
      end: 0.0,
    ).animate(_expandAnimationController);
    _collapseAnimation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_collapseAnimationController);
    show.addListener(
      () {
        if (show.value) {
          _expandAnimationController.forward();
          _collapseAnimationController.forward();
        } else {
          _expandAnimationController.reverse();
          _collapseAnimationController.reverse();
        }
      },
    );
  }

  @override
  void dispose() {
    _expandAnimationController.dispose();
    _collapseAnimationController.dispose();
    super.dispose();
  }

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
              HotelLessDetailsView(
                expandAnimation: _expandAnimation,
                hotel: widget.hotel,
                isBooking: widget.isBooking,
                animate: () => show.value = !show.value,
                book: () {
                  if (!widget.isBooking) {
                    cubit.createBooking(widget.hotel.id);
                  } else {
                    cubit.updateBooking(
                      widget.bookingId!,
                      'cancelled',
                    );
                  }
                },
              ),
              HotelMoreDetailsView(
                collapseAnimation: _collapseAnimation,
                hotel: widget.hotel,
                isBooking: widget.isBooking,
                animate: () => show.value = !show.value,
                book: () {
                  if (!widget.isBooking) {
                    cubit.createBooking(widget.hotel.id);
                  } else {
                    cubit.updateBooking(
                      widget.bookingId!,
                      'cancelled',
                    );
                  }
                },
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
                      padding: EdgeInsets.only(left: 12.w),
                      child: SizedBox(
                        width: 45.w,
                        height: 45.h,
                        child: Center(
                          child: Directionality(
                            textDirection: TextDirection.ltr,
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: AppColor.teal,
                              size: 30.r,
                            ),
                          ),
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
