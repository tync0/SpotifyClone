import 'package:spotify/src/features/auth/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    super.email,
    super.firstName,
    super.id,
    super.token,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      firstName: json['first_name'],
      id: json['id'],
      token: json['token'],
    );
  }
}
