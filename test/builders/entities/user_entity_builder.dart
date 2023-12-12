import 'package:mobile_challenge/app/domain/entities/user_entity.dart';

class UserBuilder {
  final String _id = '1';
  final String _email = 'any_email@email.com';
  final String _token = 'any_token';

  const UserBuilder._();

  factory UserBuilder.init() => const UserBuilder._();

  User build() {
    return User(
      id: _id,
      email: _email,
      token: _token,
    );
  }
}
