import 'package:dio/dio.dart';

class ProfileUpdateParamModel {
  final String name;
  final String email;
  final MultipartFile? image;

  const ProfileUpdateParamModel({
    required this.name,
    required this.email,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'image': image,
    };
  }
}
