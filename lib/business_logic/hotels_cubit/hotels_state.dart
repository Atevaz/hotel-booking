part of 'hotels_cubit.dart';

abstract class HotelsState {}

class HotelsInitial extends HotelsState {}

class HotelsUpdateUIState extends HotelsState {}

class GetHotelsLoadingState extends HotelsState {}

class GetHotelsLoadedState extends HotelsState {}

class GetHotelsLoadingErrorState extends HotelsState {
  final String message;

  GetHotelsLoadingErrorState(this.message);
}
