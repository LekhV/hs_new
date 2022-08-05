import 'package:flutter_hs/api/collections/db_sqlite/dtos/sql_collection_card_dto.dart';
import 'package:flutter_hs/data/collectios/db_sqlite/mappers/db_sqlite_mappers.dart';
import 'package:flutter_hs/domain/cards/models/card_by_params.dart';
import 'package:flutter_hs/domain/collections/db_sqlite/db_sqlite_repository.dart';
import 'package:flutter_hs/domain/collections/db_sqlite/models/sqlite_collection_card.dart';
import 'package:flutter_hs/domain/collections/db_sqlite/models/sqlite_collection_model.dart';
import 'package:flutter_hs/domain/collections/models/db_collection_card_model.dart';
import 'package:flutter_hs/domain/collections/models/db_collection_model.dart';
import 'package:flutter_hs/domain/common/exceptions.dart';
import 'package:sqflite/sqflite.dart';

import 'database_sqlite_helper.dart';

class DBSQLiteRepositoryImpl implements DBSQLiteRepository {
  final String cardsTableName = sqliteHelper.cardsTableName;
  final String collectionsTableName = sqliteHelper.collectionsTableName;

  @override
  Future<List<CollectionCard>> deleteCard({
    required String nameCollection,
    required String heroType,
    required CardByParams card,
    int? cardId,
  }) async {
    try {
      Database db = await sqliteHelper.database;
      final collectionId = await _getIdCollection(nameCollection, heroType);

      if (cardId != null) {
        await db.delete(cardsTableName, where: "${sqliteHelper.collectionCardId} LIKE '$cardId'");
      } else {
        //TODO: check 0 and delete when 0 items
        Database db = await sqliteHelper.database;

        final checkList = await _getSQLiteCards(db, collectionId).then((collection) =>
            collection.where((collection) => collection.card?.cardId == card.cardId).toList());

        if (checkList.isEmpty) {
          throw const NoElementException();
        }
        final id = checkList.last.collectionCardId;
        await db.delete(cardsTableName, where: "${sqliteHelper.collectionCardId} LIKE '$id'");
      }

      final cardsCollection = await getCollection(nameCollection, heroType);
      await _updateCollection(collectionId, cardsCollection.length);

      if (cardsCollection.isEmpty) {
        deleteCollection(nameCollection, heroType);
      }

      return cardsCollection;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteCollection(String nameCollection, String heroType) async {
    try {
      Database db = await sqliteHelper.database;
      final collectionId = await _getIdCollection(nameCollection, heroType);

      await db.delete(collectionsTableName, where: "${sqliteHelper.id} LIKE '$collectionId'");
      await db.delete(
        cardsTableName,
        where: "${sqliteHelper.collectionModelId} LIKE '$collectionId'",
      );
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<List<CollectionCard>> getCollection(String nameCollection, String heroType) async {
    try {
      Database db = await sqliteHelper.database;
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
      Database db = await sqliteHelper.database;
      final collections = await db.query(
        collectionsTableName,
        where: "${sqliteHelper.heroType} LIKE '$heroType'",
      );
      return collections.map((card) => SQLiteCollectionModel.fromJson(card)).toList().toModels();
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<List<CollectionCard>> createCollection(
      String nameCollection, CardByParams card, String heroType) async {
    try {
      Database db = await sqliteHelper.database;
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
      where: "${sqliteHelper.collectionModelId} = '$collectionModelId'",
    );

    final sqliteCards = sqliteCardsDTO
        .map((cardDTO) => SQLiteCollectionCardDTO.fromJson(cardDTO))
        .toList()
        .toModels();

    return sqliteCards;
  }

  Future<int> _getIdCollection(String name, String heroType) async {
    try {
      final db = await sqliteHelper.database;
      int id = 0;

      SQLiteCollectionModel newCollection = SQLiteCollectionModel(
        heroType: heroType,
        nameCollection: name,
      );

      final collections = await db.query(
        collectionsTableName,
        where: "${sqliteHelper.nameCollection} LIKE '$name'",
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

      return id;
    } catch (e) {
      throw UnimplementedError();
    }
  }

  Future<void> _updateCollection(int collectionId, int collectionCardsLenght) async {
    try {
      final db = await sqliteHelper.database;

      Map<String, dynamic> newCollectionCardsLenght = {
        sqliteHelper.collectionCardsLenght: collectionCardsLenght,
      };

      await db.update(
        collectionsTableName,
        newCollectionCardsLenght,
        where: "${sqliteHelper.id} LIKE '$collectionId'",
        conflictAlgorithm: ConflictAlgorithm.ignore,
      );
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<List<String>> getNamesAllCollections(String heroType) async {
    try {
      Database db = await sqliteHelper.database;
      final sqliteCollections = await db.query(
        collectionsTableName,
      );
      final collections =
          sqliteCollections.map((card) => SQLiteCollectionModel.fromJson(card)).toList().toModels();
      return collections.map((e) => e.nameCollection).toList();
    } catch (e) {
      throw UnimplementedError();
    }
  }
}
