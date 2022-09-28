import 'package:booking_hotel/data/model/common_models/status_model.dart';
import 'package:booking_hotel/data/model/user_model.dart';

class AuthResponseModel {
  final StatusModel status;
  final UserModel user;

  AuthResponseModel({
    required this.status,
    required this.user,
  });

  factory AuthResponseModel.fromMap(Map<String, dynamic> map) {
    return AuthResponseModel(
      status: StatusModel.fromJson(map['status']),
      user: UserModel.fromJson(map['data']),
    );
  }
}
