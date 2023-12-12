import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../../../core/utils/extensions.dart';
import '../entities/user_entity.dart';
import '../repositories/authentication_repository.dart';

class LoginUsecase {
  final AuthenticationRepository _repository;

  const LoginUsecase(this._repository);

  Future<Either<Failure, User>> call({
    required String email,
    required String password,
  }) async {
    if (!email.isValidEmail || password.length < 6) {
      return const Left(InvalidCredentialsFailure());
    }

    return _repository.login(email, password);
  }
}
