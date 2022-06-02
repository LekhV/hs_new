import 'package:dio/dio.dart';
import 'package:flutter_hs/config.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ApiModule {
  @lazySingleton
  Dio getDio(AppConfig appConfig) {
    final options = BaseOptions(
      baseUrl: appConfig.baseUrl,
      headers: buildHeaders(appConfig),
    );
    final dio = Dio(options);
    return dio;
  }
}

Map<String, dynamic>? buildHeaders(AppConfig appConfig) {
  return {'x-rapidapi-key': '336953abe4msh27e7637ce736e6ep12a161jsn2b11d7f74cc4'};
}
