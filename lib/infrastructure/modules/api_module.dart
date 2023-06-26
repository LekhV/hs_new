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
  return {
    'X-RapidAPI-Key': '9f149339a1msh638e1d9d27b2dcap193187jsn4a302d1ea34a',
    'X-RapidAPI-Host': 'omgvamp-hearthstone-v1.p.rapidapi.com'
  };
}
