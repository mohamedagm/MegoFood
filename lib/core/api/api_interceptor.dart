import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('🔹 REQUEST [${options.method}] => ${options.uri}');
    print('Headers: ${options.headers}');
    print('Query: ${options.queryParameters}');
    print('Data: ${options.data}');
    super.onRequest(options, handler);
  }
}
