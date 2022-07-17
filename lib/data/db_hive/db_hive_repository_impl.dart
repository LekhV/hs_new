import 'package:flutter_hs/domain/cards/models/card_by_params.dart';
import 'package:flutter_hs/domain/common/exceptions.dart';
import 'package:flutter_hs/domain/db_hive/db_hive_repository.dart';
import 'package:flutter_hs/domain/db_hive/models/collection_model.dart';
import 'package:flutter_hs/domain/db_hive/models/collection_card_model.dart';
import 'package:hive/hive.dart';
import '../../api/db_hive/dtos/collection_model_dto.dart';
import 'package:flutter_hs/data/db_hive/mappers/db_hive_mappers.dart';

class DBHiveRepositoryImpl implements DBHiveRepository {
  @override
  Future<List<CollectionCard>> createCollection(
    String nameCollection,
    CardByParams card,
    String heroType,
  ) async {
    try {
      var box = await Hive.openBox('CollectionsHSs');

      List<CollectionModel> collectionsList = [];
      List<CollectionCard> cardsList = [CollectionCard(card: card, collectionCardId: card.cardId!)];

      CollectionModel newCollection = CollectionModel(
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
          cardsList.addAll(collectionsList[index].collectionCards ?? []);

          if (cardsList.length > 10) {
            throw const CollectionLimitExceededException();
          }

          final checkList = cardsList
              .where((collectionCard) => collectionCard.collectionCardId == card.cardId)
              .toList();

          if (checkList.length > 2) {
            throw const CardsLimitExceededException();
          }

          collectionsList[index] = CollectionModel(
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

      return cardsList;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<CollectionCard>> deleteCard(
    String nameCollection,
    CardByParams card,
    String heroType,
  ) async {
    try {
      var box = await Hive.openBox('CollectionsHSs');
      List<CollectionModel> collectionsList = [];
      List<CollectionCard> cardsList = [];

      List collections = await box.get(heroType, defaultValue: []);

      if (collections.isNotEmpty) {
        collectionsList = collections.map((e) => e as CollectionModelDTO).toList().toModels();

        final index = collectionsList.indexWhere(
          (element) => element.nameCollection == nameCollection,
        );

        if (index != -1) {
          cardsList = collectionsList[index].collectionCards ?? [];

          final collectionCard = cardsList.firstWhere(
            (element) => element.collectionCardId == card.cardId,
            orElse: () => CollectionCard(card: card, collectionCardId: ''),
          );

          if (collectionCard.collectionCardId.isEmpty) {
            throw const NoElementException();
          }

          cardsList.remove(collectionCard);

          collectionsList[index] = CollectionModel(
            heroType: collectionsList[index].heroType,
            nameCollection: collectionsList[index].nameCollection,
            collectionCards: cardsList,
          );
        }

        if (cardsList.isEmpty) {
          collectionsList.removeWhere((element) => element.nameCollection == nameCollection);
        }

        await box.put(heroType, collectionsList.toDTOs());
      }

      return cardsList;
    } catch (e) {
      print("Failed to delete card: $e");
      rethrow;
    }
  }

  @override
  Future<void> deleteCollection(String nameCollection, String heroType) async {
    try {
      var box = await Hive.openBox('CollectionsHSs');
      List<CollectionModel> collectionsList = [];

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
      var box = await Hive.openBox('CollectionsHSs');
      List<CollectionModel> collectionsList = [];
      List<CollectionCard> cardsList = [];

      List collections = await box.get(heroType, defaultValue: []);

      if (collections.isNotEmpty) {
        collectionsList = collections.map((e) => e as CollectionModelDTO).toList().toModels();
        cardsList = collectionsList
                .firstWhere((element) => element.nameCollection == nameCollection)
                .collectionCards ??
            [];
      }

      return cardsList;
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<List<CollectionModel>> getCollections(String heroType) async {
    try {
      var box = await Hive.openBox('CollectionsHSs');
      List<CollectionModelDTO> collectionsListDTO = [];
      List<CollectionModel> collectionsList = [];

      List collections = await box.get(heroType, defaultValue: []);

      if (collections.isNotEmpty) {
        collectionsListDTO = collections.map((e) => e as CollectionModelDTO).toList();
        collectionsList = collectionsListDTO.toModels();
      }

      return collectionsList;
    } catch (e) {
      throw UnimplementedError();
    }
  }
}
