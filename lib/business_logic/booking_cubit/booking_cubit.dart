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

  BookingModel? completedBookingModel;
  BookingModel? upcommingBookingModel;
  BookingModel? cancelledBookingModel;

  List<DataList> completedBookingList = [];
  List<DataList> upcomingBookingList = [];
  List<DataList> cancelledBookingList = [];

  int selectedBookingToggleTabBar = 0;

  void changeSelectedBookingTabBar(index) {
    selectedBookingToggleTabBar = index;
    emit(ChangeSelectedToggleTabBarState());
  }

  Future getCompletedBooking() async {
    emit(GetCompletedBookingLoadingState());
    final result =
        await repositoryBooking.getBooking(token, 'completed', 10, 1);
    result.fold(
      (l) {
        emit(GetCompletedBookingErrorState());
      },
      (r) {
        completedBookingModel = r;
        completedBookingList = r.data!.dataList!;

        emit(GetCompletedBookingSuccessState());
      },
    );
  }

  Future getUpcomingBooking() async {
    emit(GetUpcomingBookingLoadingState());
    final result =
        await repositoryBooking.getBooking(token, 'upcomming', 15, 1);
    result.fold(
      (l) {
        emit(GetUpcomingBookingErrorState());
      },
      (r) {
        upcommingBookingModel = r;
        upcomingBookingList = r.data!.dataList!.where((element) => element.type == 'upcomming').toList();
        emit(GetUpcomingBookingSuccessState());
      },
    );
  }

  Future getCancelledBooking() async {
    emit(GetCancelledBookingLoadingState());
    final result =
        await repositoryBooking.getBooking(token, 'cancelled', 10, 1);
    result.fold(
      (l) {
        emit(GetCancelledBookingErrorState());
      },
      (r) {
        cancelledBookingModel = r;
        cancelledBookingList = r.data!.dataList!;
        emit(GetCancelledBookingSuccessState());
      },
    );
  }

  Future createBooking(int hotelId) async {
    emit(CreateBookingLoadingState());
    final result = await repositoryBooking.createBooking(token, hotelId);
    debugPrint('my token ==>> $token');
    result.fold(
      (l) {
        emit(CreateBookingErrorState(l));
      },
      (r) {
        emit(CreateBookingSuccessState(r.enMessage));
        getUpcomingBooking();
      },
    );
  }

  Future updateBooking(int hotelId, String type) async {
    emit(UpdateBookingLoadingState());
    final result = await repositoryBooking.updateBooking(token, hotelId, type);
    result.fold(
      (l) {
        emit(UpdateBookingErrorState(l));
      },
      (r) {
        getCancelledBooking();
        getUpcomingBooking();
        emit(UpdateBookingSuccessState(r.enMessage));
      },
    );
  }




  List<DataList> removeDuplicates(List<DataList> upcomingBooking) {
    //create one list to store the distinct models
    List<DataList> distinct = [];


    for(int i = 0; i < upcomingBooking.length; i++) {
      if (!distinct.any((element) => element.hotelId == upcomingBooking[i].hotelId)){
        distinct.add(upcomingBooking[i]);
      }
    }
    print('------------------------- amr $distinct');
    return distinct.map((e) => e).toList();
  }




}
