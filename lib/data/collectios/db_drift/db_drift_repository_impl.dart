import 'package:flutter_hs/data/collectios/db_drift/database_drift_helper.dart';
import 'package:flutter_hs/data/collectios/db_drift/mappers/db_drift_mappers.dart';
import 'package:flutter_hs/domain/cards/models/card_by_params.dart';
import 'package:flutter_hs/domain/collections/db_drift/db_drift_repository.dart';
import 'package:flutter_hs/domain/collections/db_drift/models/drift_collection_card.dart';
import 'package:flutter_hs/domain/collections/db_drift/models/drift_collection_model.dart';
import 'package:flutter_hs/domain/collections/models/db_collection_model.dart';
import 'package:flutter_hs/domain/collections/models/db_collection_card_model.dart';
import 'package:flutter_hs/domain/common/exceptions.dart';

class DBDriftRepositoryImpl implements DBDriftRepository {
  @override
  Future<List<CollectionCard>> createCollection(
      String nameCollection, CardByParams card, String heroType) async {
    try {
      var database = await driftHelper.database;
      final collectionId = await _getIdCollection(nameCollection, heroType);
      final cardsCollection = await _getDriftCards(collectionId);

      final checkList = cardsCollection
          .where((collectionCard) => collectionCard.card?.cardId == card.cardId!)
          .toList();

      if (cardsCollection.length > 10) {
        throw const CollectionLimitExceededException();
      }

      if (checkList.length >= 2) {
        throw const CardsLimitExceededException();
      }

      await database
          .into(database.driftCollectionCardDTO)
          .insert(card.toDTO(collectionModelId: collectionId));

      final updatedCollection = await _getDriftCards(collectionId);

      await _updateCollection(collectionId, updatedCollection.length);

      return updatedCollection.toModels();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<CollectionCard>> deleteCard({
    required String nameCollection,
    required String heroType,
    required CardByParams card,
    int? cardId,
  }) async {
    try {
      var database = await driftHelper.database;
      final collectionId = await _getIdCollection(nameCollection, heroType);

      if (cardId != null) {
        final deletedCards = database.delete(database.driftCollectionCardDTO)
          ..where((t) => t.collectionCardId.equals(cardId));
        await deletedCards.go();
      } else {
        final checkList = await _getDriftCards(collectionId).then((collection) =>
            collection.where((collection) => collection.card?.cardId == card.cardId).toList());

        if (checkList.isEmpty) {
          throw const NoElementException();
        }
        final id = checkList.last.collectionCardId;
        final deletedCards = database.delete(database.driftCollectionCardDTO)
          ..where((t) => t.collectionCardId.equals(id));
        await deletedCards.go();
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
      var database = await driftHelper.database;
      final collectionId = await _getIdCollection(nameCollection, heroType);

      final deletedCollection = database.delete(database.driftCollectionModelDTO)
        ..where((t) => t.collectionModelId.equals(collectionId));
      await deletedCollection.go();

      final deletedCards = database.delete(database.driftCollectionCardDTO)
        ..where((t) => t.collectionModelId.equals(collectionId));
      await deletedCards.go();
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<List<CollectionCard>> getCollection(String nameCollection, String heroType) async {
    try {
      final collectionModelId = await _getIdCollection(nameCollection, heroType);
      final cardsCollection = await _getDriftCards(collectionModelId);
      return cardsCollection.toModels();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<CollectionModel>> getCollections(String heroType) async {
    try {
      var database = await driftHelper.database;
      final selectedCollections = database.select(database.driftCollectionModelDTO)
        ..where((collection) => collection.heroType.equals(heroType));

      final collections = await selectedCollections.get();
      return collections.toModels().toModels();
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<List<String>> getNamesAllCollections(String heroType) async {
    try {
      var database = await driftHelper.database;
      final driftCollections = await database.select(database.driftCollectionModelDTO).get();
      final collections = driftCollections.toModels();
      return collections.map((e) => e.nameCollection!).toList();
    } catch (e) {
      throw UnimplementedError();
    }
  }

  Future<int> _getIdCollection(String name, String heroType) async {
    try {
      var database = await driftHelper.database;
      int id = 0;

      DriftCollectionModel newCollection = DriftCollectionModel(
        heroType: heroType,
        nameCollection: name,
      );

      final collections = database.select(database.driftCollectionModelDTO)
        ..where((t) => t.nameCollection.equals(name));

      final collection = await collections.getSingleOrNull();

      if (collection != null) {
        id = collection.collectionModelId!;
      } else {
        id = await database.into(database.driftCollectionModelDTO).insert(newCollection.toDTO());
      }

      return id;
    } catch (e) {
      throw UnimplementedError();
    }
  }

  Future<void> _updateCollection(int collectionId, int collectionCardsLenght) async {
    try {
      var database = await driftHelper.database;

      final updatedCollection = database.update(database.driftCollectionModelDTO)
        ..where((t) => t.collectionModelId.equals(collectionId));

      DriftCollectionModel newCollectionCardsLenght =
          DriftCollectionModel(collectionCardsLenght: collectionCardsLenght);

      await updatedCollection.write(newCollectionCardsLenght.toDTO());
    } catch (e) {
      throw UnimplementedError();
    }
  }

  Future<List<DriftCollectionCard>> _getDriftCards(int collectionModelId) async {
    var database = await driftHelper.database;

    final collections = database.select(database.driftCollectionCardDTO)
      ..where((card) => card.collectionModelId.equals(collectionModelId));

    final cardsCollection = await collections.get();

    return cardsCollection.toModels();
  }
}
