class User {
  final String id;
  final String email;
  final String token;

  const User({
    required this.id,
    required this.email,
    required this.token,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      email: map['email'],
      token: map['token'],
    );
  }
}
