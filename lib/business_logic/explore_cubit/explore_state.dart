part of 'explore_cubit.dart';

@immutable
abstract class ExploreState {}

class ExploreInitial extends ExploreState {}

class ExploreUpdateUIState extends ExploreState {}

class GetFacilitiesLoadingState extends ExploreState {}

class GetFacilitiesLoadedState extends ExploreState {}

class GetFacilitiesLoadingErrorState extends ExploreState {
  final String message;

  GetFacilitiesLoadingErrorState(this.message);
}

class SearchHotelsLoadingState extends ExploreState {}

class SearchHotelsLoadedState extends ExploreState {}

class SearchHotelsLoadingErrorState extends ExploreState {
  final String message;

  SearchHotelsLoadingErrorState(this.message);
}
