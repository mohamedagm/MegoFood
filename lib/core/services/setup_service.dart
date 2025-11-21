import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mego_food/core/api/dio_consumer.dart';
import 'package:mego_food/features/auth/data/repo/auth_repo_impl.dart';

final getIt = GetIt.instance;

class SetupService {
  static void setup() {
    getIt.registerLazySingleton<Dio>(() => Dio());

    getIt.registerLazySingleton<DioConsumer>(
      () => DioConsumer(dio: getIt<Dio>()),
    );

    getIt.registerLazySingleton<AuthRepoImpl>(
      () => AuthRepoImpl(getIt<DioConsumer>()),
    );
  }
}
