import 'package:booking_hotel/data/models/common_models/status_model.dart';
import 'package:booking_hotel/data/models/hotel_search_models_response/hotel_model.dart';

class HotelResponseModel {
  final StatusModel status;
  final int currentPage;
  final int lastPage;
  final List<HotelModel> hotels;
  final int perPage;
  final int total;

  const HotelResponseModel({
    required this.status,
    required this.currentPage,
    required this.hotels,
    required this.lastPage,
    required this.perPage,
    required this.total,
  });

  factory HotelResponseModel.fromMap(Map<String, dynamic> map) {
    final status = StatusModel.fromJson(map['status']);
    final hotelList = <HotelModel>[];
    final hList = map['data']['data'] as List;
    for (int i = 0; i < hList.length; i++) {
      final model = HotelModel.fromMap(hList[i]);
      hotelList.add(model);
    }
    return HotelResponseModel(
      status: status,
      currentPage: map['data']['current_page'],
      hotels: hotelList,
      lastPage: map['data']['last_page'],
      perPage: int.parse(map['data']['per_page']),
      total: map['data']['total'],
    );
  }
}
