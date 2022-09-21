import 'package:booking_hotel/data/models/common_models/status_model.dart';
import 'package:booking_hotel/data/models/auth_response/user_model.dart';

class AuthResponseModel {
  final StatusModel status;
  UserModel user;

  AuthResponseModel({
    required this.status,
    required this.user,
  });

  factory AuthResponseModel.fromMap(Map<String, dynamic> map) {
    return AuthResponseModel(
      status: StatusModel.fromJson(map['status']),
      user: UserModel.fromMap(map['data']),
    );
  }
}
