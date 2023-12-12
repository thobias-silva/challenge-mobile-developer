import 'package:dartz/dartz.dart';

import '../../../core/errors/exceptions.dart';
import '../../../core/errors/failures.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/authentication_repository.dart';
import '../adapters/http_client_adapter.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final HTTPClientAdapter _httpClient;

  const AuthenticationRepositoryImpl(this._httpClient);

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
}
