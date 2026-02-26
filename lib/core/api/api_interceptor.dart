import 'package:dio/dio.dart';
import 'package:mego_food/core/api/api_end_points.dart';
import 'package:mego_food/core/cache/cache_helper.dart';
import 'package:mego_food/core/routing/app_router.dart';
import 'package:mego_food/core/routing/app_routes.dart';
import 'package:mego_food/features/auth/data/models/success_login_model.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = CacheHelper.getData(key: 'token');

    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    print('🔹 REQUEST [${options.method}] => ${options.uri}');
    print('Headers: ${options.headers}');
    print('Query: ${options.queryParameters}');
    print('Data: ${options.data}');

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode != 401) {
      return handler.next(err);
    }
    final oldToken = CacheHelper.getData(key: 'token');
    final oldRefreshToken = CacheHelper.getData(key: 'refreshToken');
    if (oldToken == null || oldRefreshToken == null) {
      return handler.next(err);
    }

    try {
      final dioRefresh = Dio()..options.baseUrl = ApiEndPoints.baseUrl;
      final response = await dioRefresh.post(
        ApiEndPoints.refreshToken,
        data: {"token": oldToken, "refreshToken": oldRefreshToken},
      );
      final model = SuccessLoginModel.fromJson(response.data);
      await CacheHelper.saveData(key: 'token', value: model.token);
      await CacheHelper.saveData(
        key: 'refreshToken',
        value: model.refreshToken,
      );
      final options = err.requestOptions;

      options.headers['Authorization'] = 'Bearer ${model.token}';

      final clonedResponse = await dioRefresh.fetch(options);

      return handler.resolve(clonedResponse);
    } catch (e) {
      await CacheHelper.removeData(key: 'token');
      await CacheHelper.removeData(key: 'refreshToken');
      AppRouter.router.go(
        AppRoutes.startAuth,
      ); //yes,not Best Practice but it's work for now

      return handler.next(err);
    }
  }
}
