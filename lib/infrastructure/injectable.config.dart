// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../api/cardback/cardbacks_api.dart' as _i9;
import '../api/cards/cards_api.dart' as _i11;
import '../api/info_hs/info_hs_api.dart' as _i7;
import '../config.dart' as _i3;
import '../domain/auth/auth_repository.dart' as _i4;
import '../domain/bd_firestore/bd_firestore_repository.dart' as _i5;
import '../domain/cardbacks/cardbacks_repository.dart' as _i10;
import '../domain/cards/cards_repository.dart' as _i12;
import '../domain/info_hs/info_hs_repository.dart' as _i8;
import 'modules/api_module.dart' as _i15;
import 'modules/auh_module.dart' as _i13;
import 'modules/bd_firestore.dart' as _i14;
import 'modules/cardbacks_module.dart' as _i17;
import 'modules/cards_module.dart' as _i18;
import 'modules/info_hs_module.dart'
    as _i16; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final authModule = _$AuthModule();
  final bDFirestoreModule = _$BDFirestoreModule();
  final apiModule = _$ApiModule();
  final infoHSModule = _$InfoHSModule();
  final cardBacksModule = _$CardBacksModule();
  final cardsModule = _$CardsModule();
  gh.singleton<_i3.AppConfig>(_i3.AppConfig());
  gh.lazySingleton<_i4.AuthRepository>(() => authModule.getAuthRepository());
  gh.lazySingleton<_i5.BDFirestoreRepository>(
      () => bDFirestoreModule.getBDFirestoreRepository());
  gh.lazySingleton<_i6.Dio>(() => apiModule.getDio(get<_i3.AppConfig>()));
  gh.lazySingleton<_i7.InfoHSApi>(
      () => infoHSModule.getInfoHSApi(get<_i6.Dio>()));
  gh.lazySingleton<_i8.InfoHSRepository>(
      () => infoHSModule.getInfoHSRepository(get<_i7.InfoHSApi>()));
  gh.lazySingleton<_i9.CardBacksApi>(
      () => cardBacksModule.getCardBacksApi(get<_i6.Dio>()));
  gh.lazySingleton<_i10.CardBacksRepository>(
      () => cardBacksModule.getCardBacksRepository(get<_i9.CardBacksApi>()));
  gh.lazySingleton<_i11.CardsApi>(
      () => cardsModule.getCardsApi(get<_i6.Dio>()));
  gh.lazySingleton<_i12.CardsRepository>(
      () => cardsModule.getCardsRepository(get<_i11.CardsApi>()));
  return get;
}

class _$AuthModule extends _i13.AuthModule {}

class _$BDFirestoreModule extends _i14.BDFirestoreModule {}

class _$ApiModule extends _i15.ApiModule {}

class _$InfoHSModule extends _i16.InfoHSModule {}

class _$CardBacksModule extends _i17.CardBacksModule {}

class _$CardsModule extends _i18.CardsModule {}
