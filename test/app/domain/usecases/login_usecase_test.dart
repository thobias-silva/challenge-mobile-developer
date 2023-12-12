import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_challenge/app/domain/entities/user_entity.dart';
import 'package:mobile_challenge/app/domain/repositories/authentication_repository.dart';
import 'package:mobile_challenge/app/domain/usecases/login_usecase.dart';
import 'package:mobile_challenge/core/errors/failures.dart';
import 'package:mocktail/mocktail.dart';

import '../../../builders/entities/user_entity_builder.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

void main() {
  final AuthenticationRepository repository = MockAuthenticationRepository();
  final sut = LoginUsecase(repository);

  group('LoginUsecase -', () {
    tearDown(() => reset(repository));

    test('should return Right(User) when the credentials are valid', () async {
      when(() => repository.login(any(), any()))
          .thenAnswer((_) async => Right(UserBuilder.init().build()));

      final resultOrError =
          await sut.call(email: 'test@test.com', password: 'password');

      expect(resultOrError.isRight(), true);
      expect(resultOrError.fold(id, id), isA<User>());
      expect(resultOrError.fold(id, id), UserBuilder.init().build());

      verify(() => repository.login(any(), any())).called(1);
    });

    test(
        'should return Left(InvalidCredentialsFailure) when email is a invalid email',
        () async {
      final resultOrError = await sut.call(email: 'a@', password: 'password');

      expect(resultOrError.isLeft(), true);
      expect(resultOrError.fold(id, id), isA<InvalidCredentialsFailure>());

      verifyNever(() => repository.login(any(), any()));
    });

    test(
        'should return Left(InvalidCredentialsFailure) when password is less than 6 characters',
        () async {
      final resultOrError =
          await sut.call(email: 'test@test.com', password: 'pass');

      expect(resultOrError.isLeft(), true);
      expect(resultOrError.fold(id, id), isA<InvalidCredentialsFailure>());

      verifyNever(() => repository.login(any(), any()));
    });
  });
}
