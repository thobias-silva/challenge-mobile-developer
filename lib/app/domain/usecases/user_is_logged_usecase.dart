import '../repositories/authentication_repository.dart';

class UserIsLoggedUsecase {
  final AuthenticationRepository _repository;

  const UserIsLoggedUsecase(this._repository);

  Future<bool> call() async {
    await Future.delayed(const Duration(seconds: 1));
    return _repository.isLogged();
  }
}
