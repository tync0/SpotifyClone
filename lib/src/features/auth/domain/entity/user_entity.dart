class UserEntity {
  final String? token;
  final String? email;
  final String? firstName;
  final int? id;
  const UserEntity({
    this.email,
    this.firstName,
    this.id,
    this.token,
  });
}
