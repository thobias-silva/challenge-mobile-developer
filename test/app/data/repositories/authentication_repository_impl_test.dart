import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_challenge/app/data/adapters/http_client_adapter.dart';
import 'package:mobile_challenge/app/data/repositories/authentication_repository_impl.dart';
import 'package:mobile_challenge/app/domain/entities/user_entity.dart';
import 'package:mobile_challenge/app/domain/repositories/authentication_repository.dart';
import 'package:mobile_challenge/core/errors/exceptions.dart';
import 'package:mobile_challenge/core/errors/failures.dart';
import 'package:mocktail/mocktail.dart';

import '../../../builders/entities/user_entity_builder.dart';

class MockHTTPClientAdapter extends Mock implements HTTPClientAdapter {}

void main() {
  final HTTPClientAdapter httpClient = MockHTTPClientAdapter();
  final AuthenticationRepository sut = AuthenticationRepositoryImpl(httpClient);

  group('AuthenticationRepositoryImpl -', () {
    group('login -', () {
      const String email = 'any_email';
      const String password = 'any_password';

      test('should return a Right(User) when login is successful', () async {
        when(() => httpClient.post<Map<String, dynamic>>(
              '/login',
              {
                'email': email,
                'password': password,
              },
            )).thenAnswer((_) async => {
              'id': '1',
              'token': 'any_token',
              'email': 'any_email@email.com',
            });

        final resultOrError = await sut.login(email, password);

        expect(resultOrError.isRight(), true);
        expect(resultOrError.fold(id, id), isA<User>());
        expect(resultOrError.fold(id, id), UserBuilder.init().build());
      });

      test('should return a Left(ServerFailure) when httpClient returns null',
          () async {
        when(() => httpClient.post<Map<String, dynamic>>(
              any(),
              any(),
            )).thenAnswer((_) async => null);

        final resultOrError = await sut.login(email, password);

        expect(resultOrError.isLeft(), true);
        expect(resultOrError.fold(id, id), isA<ServerFailure>());
      });
      test(
          'should return a Left(NotFoundFailure) when httpClient throws a NotFoundException',
          () async {
        when(() => httpClient.post<Map<String, dynamic>>(
              any(),
              any(),
            )).thenThrow(NotFoundException());

        final resultOrError = await sut.login(email, password);

        expect(resultOrError.isLeft(), true);
        expect(resultOrError.fold(id, id), isA<NotFoundFailure>());
      });
      test(
          'should return a Left(BadRequestFailure) when httpClient throws a BadRequestException',
          () async {
        when(() => httpClient.post<Map<String, dynamic>>(
              any(),
              any(),
            )).thenThrow(BadRequestException());

        final resultOrError = await sut.login(email, password);

        expect(resultOrError.isLeft(), true);
        expect(resultOrError.fold(id, id), isA<BadRequestFailure>());
      });
      test(
          'should return a Left(ServerFailure) when httpClient throws a ServerException',
          () async {
        when(() => httpClient.post<Map<String, dynamic>>(
              any(),
              any(),
            )).thenThrow(ServerException());

        final resultOrError = await sut.login(email, password);

        expect(resultOrError.isLeft(), true);
        expect(resultOrError.fold(id, id), isA<ServerFailure>());
      });

      test(
          'should return a Left(ServerFailure) when httpClient throws a Exception',
          () async {
        when(() => httpClient.post<Map<String, dynamic>>(
              any(),
              any(),
            )).thenThrow(Exception());

        final resultOrError = await sut.login(email, password);

        expect(resultOrError.isLeft(), true);
        expect(resultOrError.fold(id, id), isA<ServerFailure>());
      });
    });
  });
}
