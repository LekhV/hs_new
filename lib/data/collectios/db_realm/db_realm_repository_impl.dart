import 'package:flutter_hs/api/collections/db_realm/dtos/realm_collection_card_dto.dart';
import 'package:flutter_hs/api/collections/db_realm/dtos/realm_collection_model_dto.dart';
import 'package:flutter_hs/data/collectios/db_realm/mappers/db_realm_mappers.dart';
import 'package:flutter_hs/domain/cards/models/card_by_params.dart';
import 'package:flutter_hs/domain/collections/db_realm/db_realm_repository.dart';

import 'package:flutter_hs/domain/collections/models/db_collection_model.dart';
import 'package:flutter_hs/domain/collections/models/db_collection_card_model.dart';
import 'package:flutter_hs/domain/common/exceptions.dart';
import 'package:realm/realm.dart';

import 'database_realm_helper.dart';

class DBRealmRepositoryImpl implements DBRealmRepository {
  @override
  Future<List<CollectionCard>> createCollection(
    String nameCollection,
    CardByParams card,
    String heroType,
  ) async {
    try {
      var realm = Realm(await realmHelper.config);

      var collection = realm.find<RealmCollectionModelDTO>(nameCollection);

      if (collection == null) {
        RealmCollectionModelDTO newCollectionDTO = RealmCollectionModelDTO(
          nameCollection,
          heroType: heroType,
          collectionCards: [card.toDTO(card.cardId!, nameCollection)],
        );

        realm.write(() {
          realm.add(newCollectionDTO);
        });
      } else {
        var collectionCards = collection.collectionCards;

        if (collectionCards.length > 10) {
          throw const CollectionLimitExceededException();
        }
        final checkList = collectionCards
            .where((collectionCard) =>
                collectionCard.collectionCardId == card.cardId ||
                collectionCard.collectionCardId == '${card.cardId} ${card.cardId}')
            .toList();

        realm.write(() {
          if (checkList.isEmpty) {
            return collectionCards.add(card.toDTO(card.cardId!, nameCollection));
          } else if (checkList.length == 1) {
            return collectionCards.add(card.toDTO('${card.cardId} ${card.cardId}', nameCollection));
          } else if (checkList.length == 2) {
            throw const CardsLimitExceededException();
          }
        });
      }

      var realmCollection = realm.find<RealmCollectionModelDTO>(nameCollection);
      List<CollectionCard>? collectionCards = realmCollection?.collectionCards.toModels() ?? [];

      return collectionCards;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<CollectionCard>> deleteCard({
    required String nameCollection,
    required String heroType,
    required CardByParams card,
    String? cardId,
  }) async {
    try {
      var realm = Realm(await realmHelper.config);
      var collection = realm.find<RealmCollectionModelDTO>(nameCollection);

      if (collection != null) {
        var collectionCards = collection.collectionCards;
        String id = cardId ?? card.cardId!;

        final index = collectionCards.indexWhere((cardRealm) =>
            cardRealm.collectionCardId == '$id $id' || cardRealm.collectionCardId == id);

        if (index == -1) {
          throw const NoElementException();
        }

        realm.write(() {
          return realm.delete(collectionCards[index]);
        });
      } else {
        throw throw const NoElementException();
      }

      var realmCollection = realm.find<RealmCollectionModelDTO>(nameCollection);
      List<CollectionCard>? collectionCards = realmCollection?.collectionCards.toModels() ?? [];

      if (collectionCards.isEmpty) {
        realm.write(() {
          realm.delete(collection);
        });
      }

      return collectionCards;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteCollection(String nameCollection, String heroType) async {
    try {
      var realm = Realm(await realmHelper.config);

      var collection = realm.find<RealmCollectionModelDTO>(nameCollection);
      if (collection != null) {
        realm.write(() {
          realm.delete(collection);
        });
      } else {
        throw const NoElementException();
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<CollectionCard>> getCollection(String nameCollection, String heroType) async {
    try {
      var realm = Realm(await realmHelper.config);

      var realmCollection = realm.find<RealmCollectionModelDTO>(nameCollection);
      List<CollectionCard>? collectionCards = realmCollection?.collectionCards.toModels() ?? [];

      return collectionCards;
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<List<CollectionModel>> getCollections(String heroType) async {
    var realm = Realm(await realmHelper.config);
    try {
      var realmCollections = realm.all<RealmCollectionModelDTO>().query(
            "${realmHelper.heroType} == '$heroType'",
          );
      final collection = realmCollections.toList().toModels();
      return collection;
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<List<String>> getNamesAllCollections(String heroType) async {
    var realm = Realm(await realmHelper.config);
    try {
      var realmCollections = realm.all<RealmCollectionModelDTO>();
      final collections = realmCollections.toList().toModels();

      return collections.map((e) => e.nameCollection).toList();
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<List<CollectionCard>> getCardsByFilter(
    String nameCollection,
    String heroType,
    List<int> selectedCoins,
  ) async {
    try {
      var realm = Realm(await realmHelper.config);
      final filter = selectedCoins
          .asMap()
          .keys
          .map((index) => "collectionId == '$nameCollection' && cost == \$$index")
          .toList()
          .join(' || ');

      var realmCollection = realm
          .find<RealmCollectionModelDTO>(nameCollection)!
          .collectionCards
          .query(filter, selectedCoins)
          .toList();

      List<CollectionCard>? collectionCards = realmCollection.toModels();

      return collectionCards;
    } catch (e) {
      throw UnimplementedError();
    }
  }
}
