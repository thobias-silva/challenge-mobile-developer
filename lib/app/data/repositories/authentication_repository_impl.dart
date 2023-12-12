import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/errors/exceptions.dart';
import '../../../core/errors/failures.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/authentication_repository.dart';
import '../adapters/http_client_adapter.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final HTTPClientAdapter _httpClient;

  const AuthenticationRepositoryImpl(this._httpClient);

  static const String userLoggedKey = 'userLogged';

  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    try {
      final response = await _httpClient.post<Map<String, dynamic>>(
        '/login',
        {
          'email': email,
          'password': password,
        },
      );

      if (response == null) {
        return const Left(ServerFailure());
      }

      final user = User.fromMap(response);

      final sharedPrefs = await SharedPreferences.getInstance();

      await sharedPrefs.setString(userLoggedKey, user.id);

      return Right(user);
    } on ServerException {
      return const Left(ServerFailure());
    } on NotFoundException {
      return const Left(NotFoundFailure());
    } on BadRequestException {
      return const Left(BadRequestFailure());
    } catch (e) {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<bool> isLogged() async {
    try {
      final sharedPrefs = await SharedPreferences.getInstance();

      final userLogged = sharedPrefs.getString(userLoggedKey);

      if (userLogged == null) return false;

      final response =
          await _httpClient.get<Map<String, dynamic>>('/login/$userLogged');

      if (response == null) return false;

      return response['id'] == userLogged;
    } catch (e) {
      return false;
    }
  }
}
