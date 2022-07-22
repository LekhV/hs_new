import 'package:flutter_hs/api/db_sqlite/dtos/collection_card_dto.dart';
import 'package:flutter_hs/data/db_sqlite_repository.dart/mappers/collection_mappers.dart';
import 'package:flutter_hs/domain/db_sqlite/models/collection_model.dart';

import 'package:flutter_hs/domain/db_sqlite/models/collection_card_model.dart';

import 'package:flutter_hs/domain/cards/models/card_by_params.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../../domain/db_sqlite/db_sqlite_repository.dart';

class DBSQLiteRepositoryImpl implements DBSQLiteRepository {
  @override
  Future<List<CollectionCard>> deleteCard(String nameCollection, String cardId, String heroType) {
    // TODO: implement deleteCard
    throw UnimplementedError();
  }

  @override
  Future<void> deleteCollection(String nameCollection, String heroType) {
    // TODO: implement deleteCollection
    throw UnimplementedError();
  }

  @override
  Future<List<CollectionCard>> getCollection(String nameCollection, String heroType) {
    // TODO: implement getCollection
    throw UnimplementedError();
  }

  @override
  Future<List<CollectionModel>> getCollections(String heroType) {
    // TODO: implement getCollections
    throw UnimplementedError();
  }

  @override
  Future<List<CollectionCard>> createCollection(
      String nameCollection, CardByParams card, String heroType) async {
    try {
      String columnName = 'newCollection7';
      print(columnName);
      String columnNameHEROS = 'heros';

      int collectionModelId = 2; //await _createCollection(nameCollection, heroType);

      void _createDB(Database db, int version) async {
        await db.execute(
            'CREATE TABLE $columnNameHEROS(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, nameCollection TEXT NOT NULL UNIQUE, heroType TEXT)');

        await db.execute(
            'CREATE TABLE $columnName(collectionCardId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, collectionModelId INT, cardId TEXT, dbfId TEXT, name TEXT,cardSet TEXT, type TEXT, faction TEXT, rarity TEXT,cost INT, attack INT, health INT, text TEXT, flavor TEXT, artist TEXT, collectible BOOLEAN, elite BOOLEAN, playerClass TEXT, img TEXT, imgGold  TEXT, locale TEXT)');
      }

      final database = openDatabase(
        join(await getDatabasesPath(), '12hs_collections.db'),
        onCreate: (db, version) {
          return _createDB(db, 1);
        },
        version: 1,
      );
      final db = await database;

      CollectionModel newCollection = CollectionModel(
        heroType: heroType,
        nameCollection: nameCollection,
      );

      final id = await db.insert(
        columnNameHEROS,
        newCollection.toJson(),
        conflictAlgorithm: ConflictAlgorithm.ignore,
      );

      final q = await db.query(columnNameHEROS);

      final list = q.map((element) => CollectionModel.fromJson(element)).toList();
      print(q.length);
      print('id   $id');

      CollectionCardDTO collectionCard =
          card.toCollectionCard(collectionModelId: collectionModelId);

      await db.insert(
        columnName,
        collectionCard.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      List<Map<String, dynamic>> dbList = await db.rawQuery(
          'SELECT * FROM $columnName INNER JOIN $columnNameHEROS ON $columnNameHEROS.id = 1');

      final q2 = await db.query(columnName, where: "collectionModelId  = $collectionModelId");

      final cards = q2.map((element) => CollectionCardDTO.fromJson(element)).toList().toModels();
      print(q2.length);
      print(cards.length);

      return [];
    } catch (e) {
      throw UnimplementedError();
    }
  }

  Future<int> _createCollection(String name, String heroType) async {
    try {
      String columnName = heroType.replaceAll(' ', '');
      print(columnName);

      final databaseCollection = openDatabase(
        join(await getDatabasesPath(), '0hs_collections.db'),
        onCreate: (db, version) {
          return db.execute(
            'CREATE TABLE $columnName(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, nameCollection TEXT NOT NULL UNIQUE, heroType TEXT)',
          );
        },
        version: 1,
      );

      final db = await databaseCollection;

      CollectionModel newCollection = CollectionModel(
        heroType: heroType,
        nameCollection: name,
      );

      final id = await db.insert(
        columnName,
        newCollection.toJson(),
        conflictAlgorithm: ConflictAlgorithm.ignore,
      );

      final q = await db.query(columnName, where: "nameCollection LIKE '%$name%'");

      final list = q.map((element) => CollectionModel.fromJson(element)).toList();
      print(q.length);
      print('id   $id');

      return list.first.id!;
    } catch (e) {
      throw UnimplementedError();
    }
  }
}
