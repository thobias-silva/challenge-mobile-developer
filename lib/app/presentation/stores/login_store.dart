import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';

import '../../../core/errors/failures.dart';
import '../../domain/repositories/authentication_repository.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  final AuthenticationRepository _repository;

  _LoginStore(this._repository);

  String email = '';
  String password = '';

  @observable
  bool isLoading = false;

  @observable
  Failure? failure;

  @action
  Future<bool> login() async {
    failure = null;
    isLoading = true;

    final resultOrError = await _repository.login(email, password);

    isLoading = false;

    if (resultOrError.isLeft()) {
      failure = resultOrError.fold(id, id) as Failure;
      return false;
    }

    return true;
  }
}
