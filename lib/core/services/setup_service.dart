import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mego_food/core/api/dio_consumer.dart';
import 'package:mego_food/core/services/location_service.dart';
import 'package:mego_food/core/storage/hive_storage_service.dart';
import 'package:mego_food/features/search/data/repo/search_repo.dart';
import 'package:mego_food/features/auth/data/repo/auth_repo_impl.dart';
import 'package:mego_food/features/cart/data/datasource/cart_local_data_source.dart';
import 'package:mego_food/features/cart/data/repo/cart_repo.dart';
import 'package:mego_food/features/cart/data/repo/cart_repo_impl.dart';
import 'package:mego_food/features/category_restaurants/data/repo/category_restaurants_repo.dart';
import 'package:mego_food/features/home/data/repo/home_repo.dart';

final getIt = GetIt.instance;

class SetupService {
  static void setup() {
    getIt.registerLazySingleton<Dio>(() => Dio());

    getIt.registerLazySingleton<DioConsumer>(
      () => DioConsumer(dio: getIt<Dio>()),
    );
    getIt.registerLazySingleton<LocationService>(() => LocationService());
    getIt.registerLazySingleton<HiveStorageService>(
      () => HiveStorageService(),
    );

    getIt.registerLazySingleton<AuthRepoImpl>(
      () => AuthRepoImpl(getIt<DioConsumer>(), getIt.get<LocationService>()),
    );
    getIt.registerLazySingleton<SearchRepo>(
      () => SearchRepo(getIt<DioConsumer>()),
    );
    getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt<DioConsumer>()));
    getIt.registerLazySingleton<CategoryRestaurantsRepo>(
      () => CategoryRestaurantsRepo(getIt<DioConsumer>()),
    );
    getIt.registerLazySingleton<CartLocalDataSource>(
      () => CartLocalDataSource(getIt<HiveStorageService>()),
    );
    getIt.registerLazySingleton<CartRepo>(
      () => CartRepoImpl(getIt<CartLocalDataSource>()),
    );
  }
}
