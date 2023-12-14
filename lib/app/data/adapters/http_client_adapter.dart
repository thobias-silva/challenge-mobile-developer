import 'package:dio/dio.dart';

import '../../../core/errors/exceptions.dart';

abstract interface class HTTPClientAdapter {
  Future<T?> get<T>(String url);
  Future<T?> post<T>(String url, dynamic data);
  Future<T?> put<T>(String url, dynamic data);
  Future<T?> delete<T>(String url);
}

class DioHTTPClient implements HTTPClientAdapter {
  final Dio _dio;
  const DioHTTPClient(this._dio);

  @override
  Future<T?> get<T>(String url) async {
    try {
      final result = await _dio.get<T>(url);
      return result.data;
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode;
      final message = e.response?.statusMessage;

      if (statusCode == 404) {
        throw NotFoundException(message);
      }
      if (statusCode == 400) {
        throw BadRequestException(message);
      }

      throw ServerException(message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<T?> post<T>(String url, dynamic data) async {
    try {
      final result = await _dio.post<T>(url, data: data);
      return result.data;
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode;
      final message = e.response?.statusMessage;

      if (statusCode == 404) {
        throw NotFoundException(message);
      }
      if (statusCode == 400) {
        throw BadRequestException(message);
      }

      throw ServerException(message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<T?> put<T>(String url, dynamic data) async {
    try {
      final result = await _dio.put<T>(url, data: data);
      return result.data;
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode;
      final message = e.response?.statusMessage;

      if (statusCode == 404) {
        throw NotFoundException(message);
      }
      if (statusCode == 400) {
        throw BadRequestException(message);
      }

      throw ServerException(message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<T?> delete<T>(String url) async {
    try {
      final result = await _dio.delete<T>(url);
      return result.data;
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode;
      final message = e.response?.statusMessage;

      if (statusCode == 404) {
        throw NotFoundException(message);
      }
      if (statusCode == 400) {
        throw BadRequestException(message);
      }

      throw ServerException(message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
