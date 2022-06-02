import 'package:dio/dio.dart';
import 'package:flutter_hs/api/cards/cards_api.dart';
import 'package:flutter_hs/data/cards/cards_repository_impl.dart';
import 'package:flutter_hs/domain/cards/cards_repository.dart';
import 'package:injectable/injectable.dart';

@module
abstract class CardsModule {
  @lazySingleton
  CardsApi getCardsApi(Dio dio) => CardsApi(dio);

  @lazySingleton
  CardsRepository getCardsRepository(CardsApi api) {
    return CardsRepositoryImpl(api);
  }
}
