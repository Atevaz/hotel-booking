import 'package:dio/dio.dart';

class ProfileUpdateParamModel {
  final String token;
  final String name;
  final String email;
  final MultipartFile? image;

  const ProfileUpdateParamModel({
    required this.token,
    required this.name,
    required this.email,
    this.image,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'name': name,
      'email': email,
    };
    if (image != null) {
      map['image'] = image;
    }
    return map;
  }
}
