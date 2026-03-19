import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mego_food/core/api/dio_consumer.dart';
import 'package:mego_food/core/services/location_service.dart';
import 'package:mego_food/features/Search/repo/search_repo.dart';
import 'package:mego_food/features/auth/data/repo/auth_repo_impl.dart';

final getIt = GetIt.instance;

class SetupService {
  static void setup() {
    getIt.registerLazySingleton<Dio>(() => Dio());

    getIt.registerLazySingleton<DioConsumer>(
      () => DioConsumer(dio: getIt<Dio>()),
    );
    getIt.registerLazySingleton<LocationService>(() => LocationService());

    getIt.registerLazySingleton<AuthRepoImpl>(
      () => AuthRepoImpl(getIt<DioConsumer>(), getIt.get<LocationService>()),
    );
    getIt.registerLazySingleton<SearchRepo>(
      () => SearchRepo(getIt<DioConsumer>()),
    );
  }
}
