import '../../domain/usecases/user_is_logged_usecase.dart';

class SplashStore {
  final UserIsLoggedUsecase _userIsLoggedUsecase;

  const SplashStore(this._userIsLoggedUsecase);

  Future<bool> userIsLogged() => _userIsLoggedUsecase();
}
