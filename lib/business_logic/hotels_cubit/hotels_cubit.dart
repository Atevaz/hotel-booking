import 'package:booking_hotel/data/models/hotel_data/hotel.dart';
import 'package:booking_hotel/data/repository/hotels/hotels_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'hotels_state.dart';

class HotelsCubit extends Cubit<HotelsState> {
  final HotelsRepository hotelsRepository;
  static HotelsCubit get(context) => BlocProvider.of(context);

  List<Hotel> hotels = [];

  HotelsCubit({required this.hotelsRepository}) : super(HotelsInitial());

  getHotels(int count, int page) async {
    emit(GetHotelsLoadingState());
    final result = await hotelsRepository.getHotels(count: count, page: page);
    result.fold((l) {
      emit(GetHotelsLoadingErrorState(l));
    }, (r) {
      hotels = r;
      print(hotels);
      emit(GetHotelsLoadedState());
    });
  }
}
