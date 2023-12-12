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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.id == id &&
        other.email == email &&
        other.token == token;
  }

  @override
  int get hashCode => id.hashCode ^ email.hashCode ^ token.hashCode;
}
