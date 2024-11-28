class User {
  final String email;
  final String fullName;
  final String id;
  final String token;
  final List<String> roles;

  User(
      {required this.email,
      required this.fullName,
      required this.id,
      required this.token,
      required this.roles});

  bool get isAdmin {
    return roles.contains("admin") ? true : false;
  }
}
