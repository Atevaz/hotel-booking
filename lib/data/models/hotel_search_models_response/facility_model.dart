import 'package:equatable/equatable.dart';

class FacilityModel extends Equatable {
  final int id;
  final String name;
  final String image;

  const FacilityModel({
    required this.id,
    required this.name,
    required this.image,
  });

  factory FacilityModel.fromMap(Map<String, dynamic> map) {
    return FacilityModel(
      id: map['id'] as int,
      name: map['name'] as String,
      image: map['image'] as String,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        image,
      ];
}
