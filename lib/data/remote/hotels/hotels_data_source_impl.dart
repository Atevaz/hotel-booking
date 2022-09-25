import 'package:booking_hotel/core/constants/end_points.dart';
import 'package:booking_hotel/core/dio_service/dio_service.dart';
import 'package:booking_hotel/core/utils/dio_method.dart';
import 'package:booking_hotel/data/models/hotel_data/hotel.dart';
import 'package:booking_hotel/data/remote/hotels/hotels_data_source.dart';

class HotelsDataSourceImpl implements HotelsDataSource {
  @override
  DioService dioService;

  HotelsDataSourceImpl({required this.dioService});

  @override
  Future<List<Hotel>> getHotels({required int count, required int page}) async {
    final result = await serverRequest(
      call: () async => await dioService.get(
        endPoint: hotelsEndPoint,
        query: {
          'count': count,
          'page': page,
        },
      ),
    );
    final list = <Hotel>[];
    final data = result['data']['data'] as List;
    for (int i = 0; i < data.length; i++) {
      final model = Hotel.fromJson(data[i]);
      list.add(model);
      print(data[i]);
    }
    return list;
  }
}
