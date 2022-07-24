import 'package:flutter_hs/api/db_sqlite/dtos/sql_collection_card_dto.dart';
import 'package:flutter_hs/data/db_sqlite/mappers/db_sqlite_mappers.dart';
import 'package:flutter_hs/domain/cards/models/card_by_params.dart';
import 'package:flutter_hs/domain/collections/models/db_collection_card_model.dart';
import 'package:flutter_hs/domain/collections/models/db_collection_model.dart';
import 'package:flutter_hs/domain/common/exceptions.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../../domain/db_sqlite/db_sqlite_repository.dart';
import '../../domain/db_sqlite/models/sqlite_collection_card.dart';
import '../../domain/db_sqlite/models/sqlite_collection_model.dart';

class DBSQLiteRepositoryImpl implements DBSQLiteRepository {
  final String cardsTableName = 'Cards';
  final String collectionsTableName = 'Collections';
  // static final collectionModelId = 'collectionModelId';

  @override
  Future<List<CollectionCard>> deleteCard({
    required String nameCollection,
    required String heroType,
    required CardByParams card,
    int? cardId,
  }) async {
    try {
      Database db = await _initDataBase();

      if (cardId != null) {
        await db.delete(cardsTableName, where: "collectionCardId LIKE '$cardId'");
      } else {
        //TODO: check 0
        Database db = await _initDataBase();
        final collectionId = await _getIdCollection(nameCollection, heroType);

        final checkList = await _getSQLiteCards(db, collectionId).then((collection) =>
            collection.where((collection) => collection.card?.cardId == card.cardId).toList());

        if (checkList.isEmpty) {
          throw const NoElementException();
        }
        final id = checkList.last.collectionCardId;
        await db.delete(cardsTableName, where: "collectionCardId LIKE $id");
      }

      return await getCollection(nameCollection, heroType);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteCollection(String nameCollection, String heroType) async {
    try {
      Database db = await _initDataBase();
      final collectionId = await _getIdCollection(nameCollection, heroType);

      await db.delete(collectionsTableName, where: "id LIKE '$collectionId'");
      await db.delete(cardsTableName, where: "collectionModelId LIKE '$collectionId'");
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<List<CollectionCard>> getCollection(String nameCollection, String heroType) async {
    try {
      Database db = await _initDataBase();
      final collectionModelId = await _getIdCollection(nameCollection, heroType);

      return await _getSQLiteCards(db, collectionModelId).then(
        (sqliteCards) => sqliteCards.toModels(),
      );
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<List<CollectionModel>> getCollections(String heroType) async {
    try {
      Database db = await _initDataBase();
      final collections = await db.query(
        collectionsTableName,
        where: "heroType LIKE '$heroType'",
      );

      final list =
          collections.map((element) => SQLiteCollectionModel.fromJson(element)).toList().toModels();
      return list;
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<List<CollectionCard>> createCollection(
      String nameCollection, CardByParams card, String heroType) async {
    try {
      Database db = await _initDataBase();
      final collectionId = await _getIdCollection(nameCollection, heroType);

      SQLiteCollectionCardDTO collectionCard = card.toDTO(collectionModelId: collectionId);

      final sqliteCards = await _getSQLiteCards(db, collectionId);
      final checkList = sqliteCards
          .where((collectionCard) => collectionCard.card!.cardId! == card.cardId!)
          .toList();

      if (sqliteCards.length > 10) {
        throw const CollectionLimitExceededException();
      }

      if (checkList.length >= 2) {
        throw const CardsLimitExceededException();
      }

      await db.insert(
        cardsTableName,
        collectionCard.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      final cards = await _getSQLiteCards(db, collectionId).then(
        (sqliteCards) => sqliteCards.toModels(),
      );

      await _updateCollection(collectionId, cards.length);

      return cards;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<SQLiteCollectionCard>> _getSQLiteCards(Database db, int collectionModelId) async {
    final sqliteCardsDTO = await db.query(
      cardsTableName,
      where: "collectionModelId  = $collectionModelId ",
    );

    final sqliteCards = sqliteCardsDTO
        .map((cardDTO) => SQLiteCollectionCardDTO.fromJson(cardDTO))
        .toList()
        .toModels();

    return sqliteCards;
  }

  Future<Database> _initDataBase() async {
    void _createDB(Database db, int version) async {
      await db.execute(
          'CREATE TABLE $collectionsTableName(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, nameCollection TEXT NOT NULL UNIQUE, heroType TEXT, collectionCardsLenght INT)');

      await db.execute(
          'CREATE TABLE $cardsTableName(collectionCardId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, collectionModelId INT, cardId TEXT, dbfId TEXT, name TEXT,cardSet TEXT, type TEXT, faction TEXT, rarity TEXT,cost INT, attack INT, health INT, text TEXT, flavor TEXT, artist TEXT, collectible BOOLEAN, elite BOOLEAN, playerClass TEXT, img TEXT, imgGold  TEXT, locale TEXT)');
    }

    return openDatabase(
      join(await getDatabasesPath(), '16hs_collections.db'),
      onCreate: (db, version) {
        return _createDB(db, 1);
      },
      version: 1,
    );
  }

  Future<int> _getIdCollection(String name, String heroType) async {
    try {
      final db = await _initDataBase();
      int id = 0;

      SQLiteCollectionModel newCollection = SQLiteCollectionModel(
        heroType: heroType,
        nameCollection: name,
      );

      final collections = await db.query(
        collectionsTableName,
        where: "nameCollection LIKE '$name'",
      );
      if (collections.isNotEmpty) {
        id = collections
            .map((element) => SQLiteCollectionModel.fromJson(element))
            .toList()
            .first
            .id!;
      } else {
        id = await db.insert(
          collectionsTableName,
          newCollection.toJson(),
          conflictAlgorithm: ConflictAlgorithm.ignore,
        );
      }
      print(id);

      return id;
    } catch (e) {
      throw UnimplementedError();
    }
  }

  Future<void> _updateCollection(int collectionId, int collectionCardsLenght) async {
    try {
      final db = await _initDataBase();

      Map<String, dynamic> newCollectionCardsLenght = {
        'collectionCardsLenght': collectionCardsLenght,
      };

      await db.update(
        collectionsTableName,
        newCollectionCardsLenght,
        where: "id LIKE '$collectionId'",
        conflictAlgorithm: ConflictAlgorithm.ignore,
      );
    } catch (e) {
      throw UnimplementedError();
    }
  }
}

// List<Map<String, dynamic>> dbList = await db.rawQuery(
//     'SELECT * FROM $cardsTableName INNER JOIN $collectionsTableName ON $collectionsTableName.id = 1');

// List<Map<String, dynamic>> dbList2 = await db
//     .rawQuery('SELECT * FROM $collectionsTableName WHERE $collectionsTableName.id = 1');
