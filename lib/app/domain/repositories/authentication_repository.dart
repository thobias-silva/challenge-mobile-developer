import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../entities/user_entity.dart';

abstract interface class AuthenticationRepository {
  Future<Either<Failure, User>> login(String email, String password);
}
