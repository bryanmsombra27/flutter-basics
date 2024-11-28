import 'package:teslo_shop/features/auth/domain/domain.dart';

class UserMapper {
  static User userJsonToEntity(Map<String, dynamic> json) {
    return User(
        email: json['email'] ?? "",
        fullName: json['fullName'] ?? "",
        id: json['id'] ?? "",
        token: json['token'] ?? "",
        roles: List<String>.from(json['roles'].map((role) => role)));
  }
}
