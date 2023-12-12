abstract base class Failure {
  final String? message;
  const Failure(this.message);
}

final class InvalidParamsFailure extends Failure {
  const InvalidParamsFailure([String? message])
      : super(message ?? 'Parâmetros inválidos!');
}

final class InvalidCredentialsFailure extends Failure {
  const InvalidCredentialsFailure([String? message])
      : super(message ?? 'Credenciais inválidas!');
}

final class ServerFailure extends Failure {
  const ServerFailure([String? message])
      : super(message ?? 'Ops, ocorreu um erro!');
}

final class NotFoundFailure extends Failure {
  const NotFoundFailure([String? message]) : super(message ?? 'Não encontrado');
}

final class BadRequestFailure extends Failure {
  const BadRequestFailure([String? message])
      : super(message ?? 'Requisição inválida');
}
