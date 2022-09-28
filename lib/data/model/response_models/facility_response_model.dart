import 'package:booking_hotel/data/model/common_models/status_model.dart';
import 'package:booking_hotel/data/model/facility_mode.dart';

class FacilityResponseModel {
  final StatusModel status;
  final List<FacilityModel> facilities;

  const FacilityResponseModel({
    required this.status,
    required this.facilities,
  });

  factory FacilityResponseModel.fromJson(Map<String, dynamic> json) {
    final status = StatusModel.fromJson(json['status']);
    final facilities = FacilityModel.fromJsonList(json['data']);
    return FacilityResponseModel(
      status: status,
      facilities: facilities,
    );
  }
}
