import 'package:dio/dio.dart';
import 'package:flutter_hs/api/cardback/cardbacks_api.dart';
import 'package:flutter_hs/data/cardbacks/cardbacks_repository_impl.dart';
import 'package:flutter_hs/domain/cardbacks/cardbacks_repository.dart';
import 'package:injectable/injectable.dart';

@module
abstract class CardBacksModule {
  @lazySingleton
  CardBacksApi getCardBacksApi(Dio dio) => CardBacksApi(dio);

  @lazySingleton
  CardBacksRepository getCardBacksRepository(CardBacksApi api) {
    return CardBacksRepositoryImpl(api);
  }
}
