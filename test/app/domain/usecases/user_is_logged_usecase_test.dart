import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_challenge/app/domain/repositories/authentication_repository.dart';
import 'package:mobile_challenge/app/domain/usecases/user_is_logged_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

void main() {
  final AuthenticationRepository repository = MockAuthenticationRepository();
  final sut = UserIsLoggedUsecase(repository);

  group('UserIsLoggedUsecase -', () {
    test('should return true when the user is logged', () async {
      when(() => repository.isLogged()).thenAnswer((_) async => true);

      final result = await sut.call();

      expect(result, true);
    });

    test('should return false when the user is not logged', () async {
      when(() => repository.isLogged()).thenAnswer((_) async => false);

      final result = await sut.call();

      expect(result, false);
    });
  });
}
