import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'app/data/adapters/http_client_adapter.dart';
import 'app/data/repositories/authentication_repository_impl.dart';
import 'app/domain/repositories/authentication_repository.dart';
import 'app/domain/usecases/login_usecase.dart';

final sl = GetIt.I;

void initializeServiceLocator() {
  // Libs
  sl.registerLazySingleton(
    () => Dio(
      BaseOptions(
        baseUrl: 'https://653c0826d5d6790f5ec7c664.mockapi.io/api/v1',
      ),
    ),
  );

  // Adapters
  sl.registerLazySingleton<HTTPClientAdapter>(() => DioHTTPClient(sl()));

  // Repositories
  sl.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(sl()));

  // Usecases
  sl.registerLazySingleton(() => LoginUsecase(sl()));
}
