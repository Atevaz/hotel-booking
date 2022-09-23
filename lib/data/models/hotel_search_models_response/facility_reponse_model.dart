import 'package:booking_hotel/data/models/common_models/status_model.dart';
import 'package:booking_hotel/data/models/hotel_search_models_response/facility_model.dart';

class FacilityResponseModel {
  final StatusModel status;
  final List<FacilityModel> facilities;

  const FacilityResponseModel({
    required this.status,
    required this.facilities,
  });

  factory FacilityResponseModel.fromMap(Map<String, dynamic> map) {
    final list = <FacilityModel>[];
    final data = map['data'] as List;
    for (int i = 0; i < data.length; i++) {
      final model = FacilityModel.fromMap(data[i]);
      list.add(model);
    }
    final status = StatusModel.fromJson(map['status']);
    return FacilityResponseModel(
      status: status,
      facilities: list,
    );
  }
}
