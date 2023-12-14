import '../../domain/repositories/authentication_repository.dart';

class SplashStore {
  final AuthenticationRepository _repository;

  const SplashStore(this._repository);

  Future<bool> userIsLogged() => _repository.isLogged();
}
