import 'package:booking_hotel/data/models/hotel_data/hotel.dart';
import 'package:booking_hotel/data/repository/hotels/hotels_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'hotels_state.dart';

class HotelsCubit extends Cubit<HotelsState> {
  final HotelsRepository hotelsRepository;

  static HotelsCubit get(context) => BlocProvider.of(context);

  List<Hotel> hotels = [];
  final listC = ScrollController();
  late int page;
  final int count = 5;

  HotelsCubit({required this.hotelsRepository}) : super(HotelsInitial()) {
    page = 1;
    listC.addListener(_listScrollListener);
  }

  _listScrollListener() {
    if (listC.position.pixels > 0 && listC.position.atEdge) {
      page++;
      getHotels(true);
    }
  }

  @override
  Future<void> close() {
    listC.dispose();
    return super.close();
  }

  getHotels([bool update = false]) async {
    emit(GetHotelsLoadingState());
    final result = await hotelsRepository.getHotels(count: count, page: page);
    result.fold((l) {
      emit(GetHotelsLoadingErrorState(l));
    }, (r) {
      if (!update) {
        hotels.clear();
      }
      hotels.addAll(r);
      emit(GetHotelsLoadedState());
    });
  }
}
