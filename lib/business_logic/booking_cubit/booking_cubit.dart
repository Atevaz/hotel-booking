import 'package:booking_hotel/data/models/booking_model.dart';
import 'package:booking_hotel/data/repository/booking/repository_booking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constants/constant.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  final RepositoryBooking repositoryBooking;

  BookingCubit({required this.repositoryBooking}) : super(BookingInitial());

  static BookingCubit get(BuildContext context) => BlocProvider.of(context);

  BookingModel? completedBookingModel ;
  BookingModel? upcommingBookingModel ;
  BookingModel? cancelledBookingModel ;
  int selectedBookingToggleTabBar = 0 ;

  void changeSelectedBookingTabBar(index){
    selectedBookingToggleTabBar = index ;
    emit(ChangeSelectedToggleTabBarState());
  }

  Future getCompletedBooking() async {
    emit(GetCompletedBookingLoadingState());
    final result = await repositoryBooking.getBooking(token, 'completed', 10, 1);
    result.fold(
          (l) {
        emit(GetCompletedBookingErrorState());
      },
          (r) {
        completedBookingModel = r ;
        debugPrint(' hotel name ===>> ${completedBookingModel!.data!.dataList![0].hotel!.hotelImages![0].image}');
        emit(GetCompletedBookingSuccessState());
      },
    );
  }

  Future getUpcomingBooking() async {
    emit(GetUpcomingBookingLoadingState());
    final result = await repositoryBooking.getBooking(token, 'upcomming', 10, 1);
    result.fold(
          (l) {
        emit(GetUpcomingBookingErrorState());
      },
          (r) {
        upcommingBookingModel = r ;
        debugPrint(' hotel name ===>> ${upcommingBookingModel!.data!.dataList![0].hotel!.hotelImages![0].image}');
        emit(GetUpcomingBookingSuccessState());
      },
    );
  }

  Future getCancelledBooking() async {
    emit(GetCancelledBookingLoadingState());
    final result = await repositoryBooking.getBooking(token, 'cancelled', 10, 1);
    result.fold(
          (l) {
        emit(GetCancelledBookingErrorState());
      },
          (r) {
        cancelledBookingModel = r ;
        debugPrint(' hotel name ===>> ${cancelledBookingModel!.data!.dataList![0].hotel!.hotelImages![0].image}');
        emit(GetCancelledBookingSuccessState());
      },
    );
  }

  Future createBooking(int hotelId) async {
    emit(CreateBookingLoadingState());
    final result = await repositoryBooking.createBooking(token, hotelId);
    result.fold(
          (l) {
        emit(CreateBookingErrorState());
      },
          (r) {
        emit(CreateBookingSuccessState());
      },
    );
  }

  Future updateBooking(int hotelId , String type) async {
    emit(UpdateBookingLoadingState());
    final result = await repositoryBooking.updateBooking(token, hotelId,type);
    result.fold(
          (l) {
        emit(UpdateBookingErrorState());
      },
          (r) {
        emit(UpdateBookingSuccessState());
      },
    );
  }
}
