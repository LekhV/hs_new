// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../api/cardback/cardbacks_api.dart' as _i7;
import '../api/cards/cards_api.dart' as _i9;
import '../api/info_hs/info_hs_api.dart' as _i5;
import '../config.dart' as _i3;
import '../domain/cardbacks/cardbacks_repository.dart' as _i8;
import '../domain/cards/cards_repository.dart' as _i10;
import '../domain/info_hs/info_hs_repository.dart' as _i6;
import 'modules/api_module.dart' as _i11;
import 'modules/cardbacks_module.dart' as _i13;
import 'modules/cards_module.dart' as _i14;
import 'modules/info_hs_module.dart'
    as _i12; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final apiModule = _$ApiModule();
  final infoHSModule = _$InfoHSModule();
  final cardBacksModule = _$CardBacksModule();
  final cardsModule = _$CardsModule();
  gh.singleton<_i3.AppConfig>(_i3.AppConfig());
  gh.lazySingleton<_i4.Dio>(() => apiModule.getDio(get<_i3.AppConfig>()));
  gh.lazySingleton<_i5.InfoHSApi>(
      () => infoHSModule.getInfoHSApi(get<_i4.Dio>()));
  gh.lazySingleton<_i6.InfoHSRepository>(
      () => infoHSModule.getInfoHSRepository(get<_i5.InfoHSApi>()));
  gh.lazySingleton<_i7.CardBacksApi>(
      () => cardBacksModule.getCardBacksApi(get<_i4.Dio>()));
  gh.lazySingleton<_i8.CardBacksRepository>(
      () => cardBacksModule.getCardBacksRepository(get<_i7.CardBacksApi>()));
  gh.lazySingleton<_i9.CardsApi>(() => cardsModule.getCardsApi(get<_i4.Dio>()));
  gh.lazySingleton<_i10.CardsRepository>(
      () => cardsModule.getCardsRepository(get<_i9.CardsApi>()));
  return get;
}

class _$ApiModule extends _i11.ApiModule {}

class _$InfoHSModule extends _i12.InfoHSModule {}

class _$CardBacksModule extends _i13.CardBacksModule {}

class _$CardsModule extends _i14.CardsModule {}
