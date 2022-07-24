import 'package:flutter_hs/config.dart';
import 'package:flutter_hs/domain/cards/models/card_by_params.dart';
import 'package:flutter_hs/domain/collections/models/db_collection_card_model.dart';
import 'package:flutter_hs/domain/collections/models/db_collection_model.dart';
import 'package:flutter_hs/domain/common/exceptions.dart';
import 'package:flutter_hs/domain/db_hive/db_hive_repository.dart';
import 'package:flutter_hs/domain/db_hive/models/hive_collection_model.dart';
import 'package:hive/hive.dart';
import '../../api/db_hive/dtos/collection_model_dto.dart';
import 'package:flutter_hs/data/db_hive/mappers/db_hive_mappers.dart';

import '../../domain/db_hive/models/hive_collection_card_model.dart';

class DBHiveRepositoryImpl implements DBHiveRepository {
  final String hiveCollection = config.hiveCollection;

  @override
  Future<List<CollectionCard>> createCollection(
    String nameCollection,
    CardByParams card,
    String heroType,
  ) async {
    try {
      var box = await Hive.openBox(hiveCollection);

      List<HiveCollectionModel> collectionsList = [];
      List<HiveCollectionCard> cardsList = [
        HiveCollectionCard(card: card, collectionCardId: card.cardId!)
      ];

      HiveCollectionModel newCollection = HiveCollectionModel(
        heroType: heroType,
        nameCollection: nameCollection,
        collectionCards: cardsList,
      );
      List collections = await box.get(heroType, defaultValue: []);

      if (collections.isNotEmpty) {
        collectionsList = collections.map((e) => e as CollectionModelDTO).toList().toModels();
        final index = collectionsList.indexWhere(
          (element) => element.nameCollection == nameCollection,
        );

        if (index != -1) {
          cardsList = collectionsList[index].collectionCards ?? [];

          if (cardsList.length > 10) {
            throw const CollectionLimitExceededException();
          }

          final checkList = cardsList
              .where((collectionCard) =>
                  collectionCard.collectionCardId == card.cardId ||
                  collectionCard.collectionCardId == '${card.cardId} ${card.cardId}')
              .toList();

          if (checkList.isEmpty) {
            cardsList.add(HiveCollectionCard(card: card, collectionCardId: card.cardId!));
          } else if (checkList.length == 1) {
            cardsList.add(
              HiveCollectionCard(card: card, collectionCardId: '${card.cardId} ${card.cardId}'),
            );
          } else if (checkList.length == 2) {
            throw const CardsLimitExceededException();
          }

          collectionsList[index] = HiveCollectionModel(
            heroType: collectionsList[index].heroType,
            nameCollection: collectionsList[index].nameCollection,
            collectionCards: cardsList,
          );
        } else {
          collectionsList.add(newCollection);
        }
      } else {
        collectionsList.add(newCollection);
      }

      await box.put(heroType, collectionsList.toDTOs());

      return cardsList.toModels();
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
    String id = cardId ?? card.cardId!;
    try {
      var box = await Hive.openBox(hiveCollection);
      List<HiveCollectionModel> collectionsList = [];
      List<HiveCollectionCard> cardsList = [];

      List collections = await box.get(heroType, defaultValue: []);

      if (collections.isNotEmpty) {
        collectionsList = collections.map((e) => e as CollectionModelDTO).toList().toModels();

        final index = collectionsList.indexWhere(
          (element) => element.nameCollection == nameCollection,
        );

        if (index != -1) {
          cardsList = collectionsList[index].collectionCards ?? [];

          final checkList = cardsList
              .where((collectionCard) =>
                  collectionCard.collectionCardId == id ||
                  collectionCard.collectionCardId == '$id $id')
              .toList();

          if (cardId != null) {
            cardsList.removeWhere((collectionCard) => collectionCard.collectionCardId == cardId);
          } else {
            if (checkList.isEmpty) {
              throw const NoElementException();
            }
            cardsList.removeWhere((collectionCard) => checkList.length == 1
                ? collectionCard.collectionCardId == id
                : collectionCard.collectionCardId == '$id $id');
          }

          collectionsList[index] = HiveCollectionModel(
            heroType: collectionsList[index].heroType,
            nameCollection: collectionsList[index].nameCollection,
            collectionCards: cardsList,
          );
        } else {
          throw const NoElementException();
        }

        if (cardsList.isEmpty) {
          collectionsList.removeWhere((element) => element.nameCollection == nameCollection);
        }

        await box.put(heroType, collectionsList.toDTOs());
      }

      return cardsList.toModels();
    } catch (e) {
      print("Failed to delete card: $e");
      rethrow;
    }
  }

  @override
  Future<void> deleteCollection(String nameCollection, String heroType) async {
    try {
      var box = await Hive.openBox(hiveCollection);
      List<HiveCollectionModel> collectionsList = [];

      List collections = await box.get(heroType, defaultValue: []);
      if (collections.isEmpty) {
        throw const NoElementException();
      }
      collectionsList = collections.map((e) => e as CollectionModelDTO).toList().toModels();
      collectionsList.removeWhere((element) => element.nameCollection == nameCollection);

      await box.put(heroType, collectionsList.toDTOs());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<CollectionCard>> getCollection(String nameCollection, String heroType) async {
    try {
      var box = await Hive.openBox(hiveCollection);
      List<HiveCollectionModel> collectionsList = [];
      List<HiveCollectionCard> cardsList = [];

      List collections = await box.get(heroType, defaultValue: []);

      if (collections.isNotEmpty) {
        collectionsList = collections.map((e) => e as CollectionModelDTO).toList().toModels();
        cardsList = collectionsList
                .firstWhere((element) => element.nameCollection == nameCollection)
                .collectionCards ??
            [];
      }

      return cardsList.toModels();
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<List<CollectionModel>> getCollections(String heroType) async {
    try {
      var box = await Hive.openBox(hiveCollection);
      List<CollectionModelDTO> collectionsListDTO = [];
      List<HiveCollectionModel> collectionsList = [];

      List collections = await box.get(heroType, defaultValue: []);

      if (collections.isNotEmpty) {
        collectionsListDTO = collections.map((e) => e as CollectionModelDTO).toList();
        collectionsList = collectionsListDTO.toModels();
      }

      return collectionsList.toModels();
    } catch (e) {
      throw UnimplementedError();
    }
  }
}
