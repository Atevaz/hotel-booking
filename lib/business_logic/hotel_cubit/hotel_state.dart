part of 'hotel_cubit.dart';

@immutable
abstract class HotelState {}

class HotelInitialState extends HotelState {}

class HotelUpdateCubitState extends HotelState {}

class GetFacilitiesLoadingState extends HotelState {}

class GetFacilitiesLoadedState extends HotelState {}

class GetFacilitiesLoadingErrorState extends HotelState {
  final String message;

  GetFacilitiesLoadingErrorState(this.message);
}

class SearchHotelsLoadingState extends HotelState {}

class SearchHotelsLoadedState extends HotelState {}

class SearchHotelsLoadingErrorState extends HotelState {
  final String message;

  SearchHotelsLoadingErrorState(this.message);
}

class GetHotelsLoadingState extends HotelState {}

class GetHotelsLoadedState extends HotelState {}

class GetHotelsLoadingErrorState extends HotelState {
  final String message;

  GetHotelsLoadingErrorState(this.message);
}
