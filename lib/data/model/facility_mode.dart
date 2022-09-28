import 'package:equatable/equatable.dart';

class FacilityModel extends Equatable {
  final num id;
  final String? name;
  final String? image;
  final int? hotelId;
  final int? facilityId;

  const FacilityModel({
    required this.id,
    this.name,
    this.image,
    this.hotelId,
    this.facilityId,
  });

  factory FacilityModel.fromJson(Map<String, dynamic> json) => FacilityModel(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        hotelId: int.tryParse('${json['hotel_id']}'),
        facilityId: int.tryParse('${json['facility_id']}'),
      );

  static List<FacilityModel> fromJsonList(List<dynamic> json) {
    final result = <FacilityModel>[];
    for (int i = 0; i < json.length; i++) {
      final model = FacilityModel.fromJson(json[i]);
      result.add(model);
    }
    return result;
  }

  @override
  List<Object?> get props => [
        id,
        name,
        image,
        hotelId,
        facilityId,
      ];
}
