import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_challenge/app/data/adapters/http_client_adapter.dart';
import 'package:mobile_challenge/core/errors/exceptions.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

void main() {
  final dio = MockDio();
  final sut = DioHTTPClient(dio);

  group('DioHTTPClient -', () {
    tearDown(() => reset(dio));
    group('GET -', () {
      test('should return data when the call is successful', () async {
        when(() => dio.get<Map<String, dynamic>>(any())).thenAnswer(
          (_) async => Response(
            statusCode: 200,
            requestOptions: RequestOptions(),
            data: {
              'success': 'Sucesso',
            },
          ),
        );

        final result = await sut.get<Map<String, dynamic>>('any_url');

        expect(result, isA<Map<String, dynamic>>());
        expect(result, {'success': 'Sucesso'});
      });

      test('should throw a ServerException when return a 500 status code',
          () async {
        when(() => dio.get<Map<String, dynamic>>(any())).thenThrow(
          DioException(
            requestOptions: RequestOptions(),
            response: Response(
              statusCode: 500,
              requestOptions: RequestOptions(),
            ),
          ),
        );

        final result = sut.get<Map<String, dynamic>>('any_url');

        expect(result, throwsA(isA<ServerException>()));
      });

      test('should throw a NotFoundException when return a 404 status code',
          () async {
        when(() => dio.get<Map<String, dynamic>>(any())).thenThrow(
          DioException(
            requestOptions: RequestOptions(),
            response: Response(
              statusCode: 404,
              requestOptions: RequestOptions(),
            ),
          ),
        );

        final result = sut.get<Map<String, dynamic>>('any_url');

        expect(result, throwsA(isA<NotFoundException>()));
      });

      test('should throw a BadRequestException when return a 400 status code',
          () async {
        when(() => dio.get<Map<String, dynamic>>(any())).thenThrow(
          DioException(
            requestOptions: RequestOptions(),
            response: Response(
              statusCode: 400,
              requestOptions: RequestOptions(),
            ),
          ),
        );

        final result = sut.get<Map<String, dynamic>>('any_url');

        expect(result, throwsA(isA<BadRequestException>()));
      });

      test('should throw a ServerException when throw any exception', () async {
        when(() => dio.get<Map<String, dynamic>>(any())).thenThrow(Exception());

        final result = sut.get<Map<String, dynamic>>('any_url');

        expect(result, throwsA(isA<ServerException>()));
      });
    });

    group('POST -', () {
      test('should return data when the call is successful', () async {
        when(() =>
                dio.post<Map<String, dynamic>>(any(), data: any(named: 'data')))
            .thenAnswer(
          (_) async => Response(
            statusCode: 200,
            requestOptions: RequestOptions(),
            data: {
              'success': 'Sucesso',
            },
          ),
        );

        final result = await sut.post<Map<String, dynamic>>('any_url', {});

        expect(result, isA<Map<String, dynamic>>());
        expect(result, {'success': 'Sucesso'});
      });

      test('should throw a ServerException when return a 500 status code',
          () async {
        when(() =>
                dio.post<Map<String, dynamic>>(any(), data: any(named: 'data')))
            .thenThrow(
          DioException(
            requestOptions: RequestOptions(),
            response: Response(
              statusCode: 500,
              requestOptions: RequestOptions(),
            ),
          ),
        );

        final result = sut.post<Map<String, dynamic>>('any_url', {});

        expect(result, throwsA(isA<ServerException>()));
      });

      test('should throw a NotFoundException when return a 404 status code',
          () async {
        when(() =>
                dio.post<Map<String, dynamic>>(any(), data: any(named: 'data')))
            .thenThrow(
          DioException(
            requestOptions: RequestOptions(),
            response: Response(
              statusCode: 404,
              requestOptions: RequestOptions(),
            ),
          ),
        );

        final result = sut.post<Map<String, dynamic>>('any_url', {});

        expect(result, throwsA(isA<NotFoundException>()));
      });

      test('should throw a BadRequestException when return a 400 status code',
          () async {
        when(() =>
                dio.post<Map<String, dynamic>>(any(), data: any(named: 'data')))
            .thenThrow(
          DioException(
            requestOptions: RequestOptions(),
            response: Response(
              statusCode: 400,
              requestOptions: RequestOptions(),
            ),
          ),
        );

        final result = sut.post<Map<String, dynamic>>('any_url', {});

        expect(result, throwsA(isA<BadRequestException>()));
      });

      test('should throw a ServerException when throw any exception', () async {
        when(() =>
                dio.post<Map<String, dynamic>>(any(), data: any(named: 'data')))
            .thenThrow(Exception());

        final result = sut.post<Map<String, dynamic>>('any_url', {});

        expect(result, throwsA(isA<ServerException>()));
      });
    });

    group('PUT -', () {
      test('should return data when the call is successful', () async {
        when(() =>
                dio.put<Map<String, dynamic>>(any(), data: any(named: 'data')))
            .thenAnswer(
          (_) async => Response(
            statusCode: 200,
            requestOptions: RequestOptions(),
            data: {
              'success': 'Sucesso',
            },
          ),
        );

        final result = await sut.put<Map<String, dynamic>>('any_url', {});

        expect(result, isA<Map<String, dynamic>>());
        expect(result, {'success': 'Sucesso'});
      });

      test('should throw a ServerException when return a 500 status code',
          () async {
        when(() =>
                dio.put<Map<String, dynamic>>(any(), data: any(named: 'data')))
            .thenThrow(
          DioException(
            requestOptions: RequestOptions(),
            response: Response(
              statusCode: 500,
              requestOptions: RequestOptions(),
            ),
          ),
        );

        final result = sut.put<Map<String, dynamic>>('any_url', {});

        expect(result, throwsA(isA<ServerException>()));
      });

      test('should throw a NotFoundException when return a 404 status code',
          () async {
        when(() =>
                dio.put<Map<String, dynamic>>(any(), data: any(named: 'data')))
            .thenThrow(
          DioException(
            requestOptions: RequestOptions(),
            response: Response(
              statusCode: 404,
              requestOptions: RequestOptions(),
            ),
          ),
        );

        final result = sut.put<Map<String, dynamic>>('any_url', {});

        expect(result, throwsA(isA<NotFoundException>()));
      });

      test('should throw a BadRequestException when return a 400 status code',
          () async {
        when(() =>
                dio.put<Map<String, dynamic>>(any(), data: any(named: 'data')))
            .thenThrow(
          DioException(
            requestOptions: RequestOptions(),
            response: Response(
              statusCode: 400,
              requestOptions: RequestOptions(),
            ),
          ),
        );

        final result = sut.put<Map<String, dynamic>>('any_url', {});

        expect(result, throwsA(isA<BadRequestException>()));
      });

      test('should throw a ServerException when throw any exception', () async {
        when(() =>
                dio.put<Map<String, dynamic>>(any(), data: any(named: 'data')))
            .thenThrow(Exception());

        final result = sut.put<Map<String, dynamic>>('any_url', {});

        expect(result, throwsA(isA<ServerException>()));
      });
    });

    group('DELETE -', () {
      test('should return data when the call is successful', () async {
        when(() => dio.delete<Map<String, dynamic>>(any())).thenAnswer(
          (_) async => Response(
            statusCode: 200,
            requestOptions: RequestOptions(),
            data: {
              'success': 'Sucesso',
            },
          ),
        );

        final result = await sut.delete<Map<String, dynamic>>('any_url');

        expect(result, isA<Map<String, dynamic>>());
        expect(result, {'success': 'Sucesso'});
      });

      test('should throw a ServerException when return a 500 status code',
          () async {
        when(() => dio.delete<Map<String, dynamic>>(any())).thenThrow(
          DioException(
            requestOptions: RequestOptions(),
            response: Response(
              statusCode: 500,
              requestOptions: RequestOptions(),
            ),
          ),
        );

        final result = sut.delete<Map<String, dynamic>>('any_url');

        expect(result, throwsA(isA<ServerException>()));
      });

      test('should throw a NotFoundException when return a 404 status code',
          () async {
        when(() => dio.delete<Map<String, dynamic>>(any())).thenThrow(
          DioException(
            requestOptions: RequestOptions(),
            response: Response(
              statusCode: 404,
              requestOptions: RequestOptions(),
            ),
          ),
        );

        final result = sut.delete<Map<String, dynamic>>('any_url');

        expect(result, throwsA(isA<NotFoundException>()));
      });

      test('should throw a BadRequestException when return a 400 status code',
          () async {
        when(() => dio.delete<Map<String, dynamic>>(any())).thenThrow(
          DioException(
            requestOptions: RequestOptions(),
            response: Response(
              statusCode: 400,
              requestOptions: RequestOptions(),
            ),
          ),
        );

        final result = sut.delete<Map<String, dynamic>>('any_url');

        expect(result, throwsA(isA<BadRequestException>()));
      });

      test('should throw a ServerException when throw any exception', () async {
        when(() => dio.delete<Map<String, dynamic>>(any()))
            .thenThrow(Exception());

        final result = sut.delete<Map<String, dynamic>>('any_url');

        expect(result, throwsA(isA<ServerException>()));
      });
    });
  });
}
