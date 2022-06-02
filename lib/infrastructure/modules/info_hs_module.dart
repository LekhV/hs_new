import 'package:dio/dio.dart';
import 'package:flutter_hs/api/info_hs/info_hs_api.dart';
import 'package:flutter_hs/data/info_hs/info_hs_repository_impl.dart';
import 'package:flutter_hs/domain/info_hs/info_hs_repository.dart';
import 'package:injectable/injectable.dart';

@module
abstract class InfoHSModule {
  @lazySingleton
  InfoHSApi getInfoHSApi(Dio dio) => InfoHSApi(dio);

  @lazySingleton
  InfoHSRepository getInfoHSRepository(InfoHSApi api) {
    return InfoHSRepositoryImpl(api);
  }
}
