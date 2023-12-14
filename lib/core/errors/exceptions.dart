class ServerException implements Exception {
  final String? message;

  ServerException([this.message = 'Ops, ocorreu um erro!']);
}

class NotFoundException implements Exception {
  final String? message;

  NotFoundException([this.message = 'Não encontrado']);
}

class BadRequestException implements Exception {
  final String? message;

  BadRequestException([this.message = 'Requisição inválida']);
}
