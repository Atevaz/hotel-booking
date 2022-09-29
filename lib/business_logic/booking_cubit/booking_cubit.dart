import 'package:booking_hotel/data/model/booking_model.dart';
import 'package:booking_hotel/data/model/param_models/booking_create_param_model.dart';
import 'package:booking_hotel/data/model/param_models/booking_fetch_param_model.dart';
import 'package:booking_hotel/data/model/param_models/booking_update_param_model.dart';
import 'package:booking_hotel/data/repository/booking/booking_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  final BookingRepository bookingRepository;
  bool isEng = true;

  BookingCubit({required this.bookingRepository})
      : super(BookingInitialState());

  void updateAppLang(bool isEnglish) {
    isEng = isEnglish;
    emit(BookingInitialState());
  }

  static BookingCubit get(BuildContext context) => BlocProvider.of(context);

  late String token;

  void setUpToken(String myToken) {
    token = myToken;
    emit(BookingIUpdateCubitState());
  }

  List<BookingModel> completedBookingList = [];
  List<BookingModel> upcomingBookingList = [];
  List<BookingModel> cancelledBookingList = [];

  int selectedBookingToggleTabBar = 0;

  ScrollController? upcomingC;
  ScrollController? completedC;
  ScrollController? canceledC;

  int? upcomingLastPage;
  int? completedLastPage;
  int? canceledLastPage;
  int completedPage = 1;
  int upcomingPage = 1;
  int canceledPage = 1;
  final int count = 5;

  onLogoutReset() {
    completedBookingList.clear();
    upcomingBookingList.clear();
    cancelledBookingList.clear();

    selectedBookingToggleTabBar = 0;

    upcomingC = null;
    completedC = null;
    canceledC = null;

    upcomingLastPage = null;
    completedLastPage = null;
    canceledLastPage = null;
    completedPage = 1;
    upcomingPage = 1;
    canceledPage = 1;
    emit(BookingIUpdateCubitState());
  }

  Future initBooking(String myToken) async {
    setUpToken(myToken);
    await getUpcomingBooking();
    await getCompletedBooking();
    await getCancelledBooking();
  }

  addListeners() {
    if (upcomingC == null && completedC == null && canceledC == null) {
      upcomingC = ScrollController();
      completedC = ScrollController();
      canceledC = ScrollController();
      upcomingC!.addListener(_bookingListener);
      completedC!.addListener(_bookingListener);
      canceledC!.addListener(_bookingListener);
      emit(BookingIUpdateCubitState());
    }
  }

  _bookingListener() {
    if (upcomingC!.position.pixels > 0 &&
        upcomingC!.position.atEdge &&
        upcomingLastPage != null &&
        upcomingPage < upcomingLastPage!) {
      upcomingPage++;
      getUpcomingBooking(true);
    }
    if (completedC!.position.pixels > 0 &&
        completedC!.position.atEdge &&
        completedLastPage != null &&
        completedPage < completedLastPage!) {
      completedPage++;
      getCompletedBooking(true);
    }
    if (canceledC!.position.pixels > 0 &&
        canceledC!.position.atEdge &&
        canceledLastPage != null &&
        canceledPage < canceledLastPage!) {
      canceledPage++;
      getCancelledBooking(true);
    }
  }

  void changeSelectedBookingTabBar(index) {
    selectedBookingToggleTabBar = index;
    emit(ChangeSelectedToggleTabBarState());
  }

  Future getCompletedBooking([bool update = false]) async {
    if (!update) {
      completedPage = 1;
    }
    emit(GetCompletedBookingLoadingState());
    final param = BookingFetchParamModel(
      token: token,
      type: 'completed',
      count: count,
      page: completedPage,
    );
    final result = await bookingRepository.getBooking(param, isEng: isEng);
    result.fold(
      (l) {
        emit(GetCompletedBookingErrorState(l));
      },
      (r) {
        if (!update) {
          completedBookingList.clear();
        }
        completedBookingList.addAll(r.bookings);
        emit(GetCompletedBookingSuccessState(
            isEng ? r.status.enMessage : r.status.arMessage));
      },
    );
  }

  Future getUpcomingBooking([bool update = false]) async {
    if (!update) {
      upcomingPage = 1;
    }
    emit(GetUpcomingBookingLoadingState());
    final param = BookingFetchParamModel(
      token: token,
      type: 'upcomming',
      count: count,
      page: upcomingPage,
    );
    final result = await bookingRepository.getBooking(param, isEng: isEng);
    result.fold(
      (l) {
        emit(GetUpcomingBookingErrorState(l));
      },
      (r) {
        if (!update) {
          upcomingBookingList.clear();
        }
        upcomingBookingList.addAll(r.bookings);
        emit(GetUpcomingBookingSuccessState(
            isEng ? r.status.enMessage : r.status.arMessage));
      },
    );
  }

  Future getCancelledBooking([bool update = false]) async {
    if (!update) {
      canceledPage = 1;
    }
    emit(GetCancelledBookingLoadingState());
    final param = BookingFetchParamModel(
      token: token,
      type: 'cancelled',
      count: count,
      page: canceledPage,
    );
    final result = await bookingRepository.getBooking(param, isEng: isEng);
    result.fold(
      (l) {
        emit(GetCancelledBookingErrorState(l));
      },
      (r) {
        if (!update) {
          cancelledBookingList.clear();
        }
        cancelledBookingList.addAll(r.bookings);
        emit(GetCancelledBookingSuccessState(
            isEng ? r.status.enMessage : r.status.arMessage));
      },
    );
  }

  Future createBooking(int hotelId) async {
    emit(CreateBookingLoadingState());
    final param = BookingCreateParamModel(token: token, hotelId: hotelId);
    final result = await bookingRepository.createBooking(param, isEng: isEng);
    result.fold(
      (l) {
        emit(CreateBookingErrorState(l));
      },
      (r) {
        emit(CreateBookingSuccessState(isEng ? r.enMessage : r.arMessage));
        getUpcomingBooking();
      },
    );
  }

  Future updateBooking(int bookingId, String type) async {
    emit(UpdateBookingLoadingState());
    final param = BookingUpdateParamModel(
      token: token,
      type: type,
      bookingId: bookingId,
    );
    final result = await bookingRepository.updateBooking(param, isEng: isEng);
    result.fold(
      (l) {
        emit(UpdateBookingErrorState(l));
      },
      (r) {
        getCancelledBooking();
        getUpcomingBooking();
        emit(UpdateBookingSuccessState(isEng ? r.enMessage : r.arMessage));
      },
    );
  }
}
