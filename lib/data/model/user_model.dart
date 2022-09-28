import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final int id;
  final String name;
  final String email;
  final String token;
  final String? image;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.token,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'api_token': token,
      'image': image
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      token: json['api_token'] as String,
      image: json['image'] as String?,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        token,
        image,
      ];
}
