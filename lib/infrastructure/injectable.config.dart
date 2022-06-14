// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../api/cardback/cardbacks_api.dart' as _i8;
import '../api/cards/cards_api.dart' as _i10;
import '../api/info_hs/info_hs_api.dart' as _i6;
import '../config.dart' as _i3;
import '../domain/auth/auth_repository.dart' as _i4;
import '../domain/cardbacks/cardbacks_repository.dart' as _i9;
import '../domain/cards/cards_repository.dart' as _i11;
import '../domain/info_hs/info_hs_repository.dart' as _i7;
import 'modules/api_module.dart' as _i13;
import 'modules/auh_module.dart' as _i12;
import 'modules/cardbacks_module.dart' as _i15;
import 'modules/cards_module.dart' as _i16;
import 'modules/info_hs_module.dart'
    as _i14; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final authModule = _$AuthModule();
  final apiModule = _$ApiModule();
  final infoHSModule = _$InfoHSModule();
  final cardBacksModule = _$CardBacksModule();
  final cardsModule = _$CardsModule();
  gh.singleton<_i3.AppConfig>(_i3.AppConfig());
  gh.lazySingleton<_i4.AuthRepository>(
      () => authModule.getCardBacksRepository());
  gh.lazySingleton<_i5.Dio>(() => apiModule.getDio(get<_i3.AppConfig>()));
  gh.lazySingleton<_i6.InfoHSApi>(
      () => infoHSModule.getInfoHSApi(get<_i5.Dio>()));
  gh.lazySingleton<_i7.InfoHSRepository>(
      () => infoHSModule.getInfoHSRepository(get<_i6.InfoHSApi>()));
  gh.lazySingleton<_i8.CardBacksApi>(
      () => cardBacksModule.getCardBacksApi(get<_i5.Dio>()));
  gh.lazySingleton<_i9.CardBacksRepository>(
      () => cardBacksModule.getCardBacksRepository(get<_i8.CardBacksApi>()));
  gh.lazySingleton<_i10.CardsApi>(
      () => cardsModule.getCardsApi(get<_i5.Dio>()));
  gh.lazySingleton<_i11.CardsRepository>(
      () => cardsModule.getCardsRepository(get<_i10.CardsApi>()));
  return get;
}

class _$AuthModule extends _i12.AuthModule {}

class _$ApiModule extends _i13.ApiModule {}

class _$InfoHSModule extends _i14.InfoHSModule {}

class _$CardBacksModule extends _i15.CardBacksModule {}

class _$CardsModule extends _i16.CardsModule {}
