class UserModel {
  final int id;
  final String name;
  final String email;
  final String? emailVerifiedAt;
  final String token;
  final String? image;
  final String createdAt;
  final String updatedAt;
  final String? googleId;
  final String? provider;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    required this.token,
    this.image,
    required this.createdAt,
    required this.updatedAt,
    this.googleId,
    this.provider,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'email_verified_at': emailVerifiedAt,
      'api_token': token,
      'image': image,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'google_id': googleId,
      'provider': provider,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      emailVerifiedAt: map['email_verified_at'] as String?,
      token: map['api_token'] as String,
      image: map['image'] as String?,
      createdAt: map['created_at'] as String,
      updatedAt: map['updated_at'] as String,
      googleId: map['google_id'] as String?,
      provider: map['provider'] as String?,
    );
  }
}
