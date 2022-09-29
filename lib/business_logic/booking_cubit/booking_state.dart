part of 'booking_cubit.dart';

@immutable
abstract class BookingState {}

class BookingInitialState extends BookingState {}

class BookingIUpdateCubitState extends BookingState {}

class GetCompletedBookingLoadingState extends BookingState {}

class GetCompletedBookingSuccessState extends BookingState {
  final String message;

  GetCompletedBookingSuccessState(this.message);
}

class GetCompletedBookingErrorState extends BookingState {
  final String message;

  GetCompletedBookingErrorState(this.message);
}

class GetCancelledBookingLoadingState extends BookingState {}

class GetCancelledBookingSuccessState extends BookingState {
  final String message;

  GetCancelledBookingSuccessState(this.message);
}

class GetCancelledBookingErrorState extends BookingState {
  final String message;

  GetCancelledBookingErrorState(this.message);
}

class GetUpcomingBookingLoadingState extends BookingState {}

class GetUpcomingBookingSuccessState extends BookingState {
  final String message;

  GetUpcomingBookingSuccessState(this.message);
}

class GetUpcomingBookingErrorState extends BookingState {
  final String message;

  GetUpcomingBookingErrorState(this.message);
}

class CreateBookingLoadingState extends BookingState {}

class CreateBookingSuccessState extends BookingState {
  final String message;

  CreateBookingSuccessState(this.message);
}

class CreateBookingErrorState extends BookingState {
  final String message;

  CreateBookingErrorState(this.message);
}

class UpdateBookingLoadingState extends BookingState {}

class UpdateBookingSuccessState extends BookingState {
  final String message;

  UpdateBookingSuccessState(this.message);
}

class UpdateBookingErrorState extends BookingState {
  final String message;

  UpdateBookingErrorState(this.message);
}

class ChangeSelectedToggleTabBarState extends BookingState {}
