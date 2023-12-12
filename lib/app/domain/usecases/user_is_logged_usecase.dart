import '../repositories/authentication_repository.dart';

class UserIsLoggedUsecase {
  final AuthenticationRepository _repository;

  const UserIsLoggedUsecase(this._repository);

  Future<bool> call() => _repository.isLogged();
}
