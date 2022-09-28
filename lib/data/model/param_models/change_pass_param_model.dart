class ChangePasswordParamModel {
  final String token;
  final String password;
  final String confirmationPassword;
  final String email;

  const ChangePasswordParamModel({
    required this.token,
    required this.password,
    required this.confirmationPassword,
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      'password': password,
      'password_confirmation': confirmationPassword,
      'email': email,
    };
  }
}
