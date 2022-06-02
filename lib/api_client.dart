import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';

//import 'package:dio_flutter_transformer/dio_flutter_transformer.dart';
import 'config.dart';

class ClientWrapper {
  static final config = GetIt.instance.get<AppConfig>();

  Dio? _dio;

  ClientWrapper() {
    _dio = Dio(
      BaseOptions(
        baseUrl: config.baseUrl,
      ),
    )..interceptors.add(
        InterceptorsWrapper(
          onRequest: _requestInterceptor,
        ),
      );
  }

  Dio? get client => _dio;

  void _requestInterceptor(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers
        .addAll({'x-rapidapi-key': '336953abe4msh27e7637ce736e6ep12a161jsn2b11d7f74cc4'});
    // return options;
  }

  // Future<RequestOptions> _requestInterceptor(RequestOptions options) async {
  //   options.headers
  //       .addAll({'x-rapidapi-key': '336953abe4msh27e7637ce736e6ep12a161jsn2b11d7f74cc4'});
  //   return options;
  // }
}
