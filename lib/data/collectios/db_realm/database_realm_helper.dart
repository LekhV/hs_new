import 'package:flutter_hs/api/collections/db_realm/dtos/realm_collection_card_dto.dart';
import 'package:flutter_hs/api/collections/db_realm/dtos/realm_collection_model_dto.dart';
import 'package:realm/realm.dart';

class DatabaseRealmHelper {
  final _databaseVersion = 11;

  final _heroType = 'heroType';
  String get heroType => _heroType;

  Future<LocalConfiguration> _initDataBase() async {
    return Configuration.local(
      [RealmCollectionModelDTO.schema, RealmCollectionCardDTO.schema],
      schemaVersion: _databaseVersion,
    );
  }

  LocalConfiguration? _config;
  Future<LocalConfiguration> get config async {
    if (_config != null) return _config!;
    _config = await _initDataBase();
    return _config!;
  }
}

final DatabaseRealmHelper realmHelper = DatabaseRealmHelper();
