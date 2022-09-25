part of 'booking_cubit.dart';

@immutable
abstract class BookingState {}

class BookingInitial extends BookingState {}

class GetCompletedBookingLoadingState extends BookingState {}
class GetCompletedBookingSuccessState extends BookingState {}
class GetCompletedBookingErrorState extends BookingState {}

class GetCancelledBookingLoadingState extends BookingState {}
class GetCancelledBookingSuccessState extends BookingState {}
class GetCancelledBookingErrorState extends BookingState {}

class GetUpcomingBookingLoadingState extends BookingState {}
class GetUpcomingBookingSuccessState extends BookingState {}
class GetUpcomingBookingErrorState extends BookingState {}

class CreateBookingLoadingState extends BookingState {}
class CreateBookingSuccessState extends BookingState {}
class CreateBookingErrorState extends BookingState {}

class UpdateBookingLoadingState extends BookingState {}
class UpdateBookingSuccessState extends BookingState {}
class UpdateBookingErrorState extends BookingState {}

class ChangeSelectedToggleTabBarState extends BookingState {}
