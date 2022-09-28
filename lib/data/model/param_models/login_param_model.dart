class LoginParamModel {
  final String email;
  final String password;

  const LoginParamModel({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };

  factory LoginParamModel.fromJson(Map<String, dynamic> json) {
    return LoginParamModel(
      email: json['email'] as String,
      password: json['password'] as String,
    );
  }
}
