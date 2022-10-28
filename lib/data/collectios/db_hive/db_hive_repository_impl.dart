import 'package:flutter_hs/data/collectios/db_hive/mappers/db_hive_mappers.dart';
import 'package:flutter_hs/domain/cards/models/card_by_params.dart';
import 'package:flutter_hs/domain/collections/db_hive/db_hive_repository.dart';
import 'package:flutter_hs/domain/collections/db_hive/models/hive_collection_card_model.dart';
import 'package:flutter_hs/domain/collections/db_hive/models/hive_collection_model.dart';
import 'package:flutter_hs/domain/collections/models/db_collection_card_model.dart';
import 'package:flutter_hs/domain/collections/models/db_collection_model.dart';
import 'package:flutter_hs/domain/common/exceptions.dart';
import 'package:hive/hive.dart';

import '../../../api/collections/db_hive/dtos/collection_model_dto.dart';
import 'database_hive_helper.dart';
import 'package:flutter/foundation.dart';

class DBHiveRepositoryImpl implements DBHiveRepository {
  @override
  Future<List<CollectionCard>> createCollection(
    String nameCollection,
    CardByParams card,
    String heroType,
  ) async {
    try {
      var box = await hiveHelper.hiveBox;

      List<HiveCollectionCard> cardsList = [
        HiveCollectionCard(card: card, collectionCardId: card.cardId!),
      ];

      HiveCollectionModel newCollection = HiveCollectionModel(
        heroType: heroType,
        nameCollection: nameCollection,
        collectionCards: cardsList,
      );
      final collectionsList = await _getHiveCollections();

      if (collectionsList.isNotEmpty) {
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

          CollectionModelDTO collectionDTO = box.getAt(index);
          collectionDTO.collectionCards = cardsList.toDTOs();
          await collectionDTO.save();
        } else {
          await box.add(newCollection.toDTO());
        }
      } else {
        await box.add(newCollection.toDTO());
      }

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
      var box = await hiveHelper.hiveBox;
      List<HiveCollectionCard> cardsList = [];

      final collectionsList = await _getHiveCollections();

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

        CollectionModelDTO collectionDTO = box.getAt(index);
        collectionDTO.collectionCards = cardsList.toDTOs();
        await collectionDTO.save();

        if (cardsList.isEmpty) {
          await collectionDTO.delete();
        }
      } else {
        throw const NoElementException();
      }

      return cardsList.toModels();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteCollection(String nameCollection, String heroType) async {
    try {
      var box = await hiveHelper.hiveBox;

      final collectionsList = await _getHiveCollections();
      if (collectionsList.isEmpty) {
        throw const NoElementException();
      }
      final index = collectionsList.indexWhere(
        (element) => element.nameCollection == nameCollection,
      );

      if (index != -1) {
        CollectionModelDTO collectionDTO = box.getAt(index);
        await collectionDTO.delete();
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<CollectionCard>> getCollection(String nameCollection, String heroType) async {
    try {
      List<HiveCollectionCard> cardsList = [];
      final collectionsList = await _getHiveCollections();
      cardsList = collectionsList
              .firstWhere((collection) => collection.nameCollection == nameCollection)
              .collectionCards ??
          [];

      return cardsList.toModels();
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<List<CollectionModel>> getCollections(String heroType) async {
    try {
      List<HiveCollectionModel> collectionsList = await _getHiveCollections().then((list) =>
          list.isNotEmpty
              ? list.where((collection) => collection.heroType == heroType).toList()
              : []);

      return collectionsList.toModels();
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<List<String>> getNamesAllCollections(String heroType) async {
    try {
      final collectionsList = await _getHiveCollections();
      return collectionsList.toModels().map((e) => e.nameCollection).toList();
    } catch (e) {
      throw UnimplementedError();
    }
  }

  Future<List<HiveCollectionModel>> _getHiveCollections() async {
    try {
      var box = await hiveHelper.hiveBox;
      List<HiveCollectionModel> collectionsList = [];

      List collections = box.values.toList();
      if (collections.isNotEmpty) {
        collectionsList = collections.map((e) => e as CollectionModelDTO).toList().toModels();
      }
      return collectionsList;
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<List<CollectionCard>> getCardsByFilter(
      String nameCollection, String heroType, List<int> selectedCoins) async {
    try {
      final cards = await getCollection(nameCollection, heroType);
      return cards.where((collectionCard) {
        final check =
            selectedCoins.firstWhere((coin) => collectionCard.card.cost == coin, orElse: () => -1);
        return check != -1;
      }).toList();
    } catch (e) {
      throw UnimplementedError();
    }
  }
}

// class DBHiveRepositoryImpl implements DBHiveRepository {
//   @override
//   Future<List<CollectionCard>> createCollection(
//     String nameCollection,
//     CardByParams card,
//     String heroType,
//   ) async {
//     try {
//       var box = await hiveHelper.hiveBox;

//       List<HiveCollectionCard> cardsList = [];

//       HiveCollectionModel newCollection = HiveCollectionModel(
//         heroType: heroType,
//         nameCollection: nameCollection,
//         collectionCards: [HiveCollectionCard(card: card, collectionCardId: card.cardId!)],
//       );
//       final collectionsList = await _getHiveCollections(heroType);

//       if (collectionsList.isNotEmpty) {
//         final index = collectionsList.indexWhere(
//           (element) => element.nameCollection == nameCollection,
//         );

//         if (index != -1) {
//           cardsList = collectionsList[index].collectionCards ?? [];

//           if (cardsList.length > 10) {
//             throw const CollectionLimitExceededException();
//           }

//           final checkList = cardsList
//               .where((collectionCard) =>
//                   collectionCard.collectionCardId == card.cardId ||
//                   collectionCard.collectionCardId == '${card.cardId} ${card.cardId}')
//               .toList();

//           if (checkList.isEmpty) {
//             cardsList.add(HiveCollectionCard(card: card, collectionCardId: card.cardId!));
//           } else if (checkList.length == 1) {
//             cardsList.add(
//               HiveCollectionCard(card: card, collectionCardId: '${card.cardId} ${card.cardId}'),
//             );
//           } else if (checkList.length == 2) {
//             throw const CardsLimitExceededException();
//           }

//           collectionsList[index] = HiveCollectionModel(
//             heroType: collectionsList[index].heroType,
//             nameCollection: collectionsList[index].nameCollection,
//             collectionCards: cardsList,
//           );
//         } else {
//           collectionsList.add(newCollection);
//         }
//       } else {
//         collectionsList.add(newCollection);
//       }

//       await box.put(heroType, collectionsList.toDTOs());

//       return cardsList.toModels();
//     } catch (e) {
//       rethrow;
//     }
//   }

//   @override
//   Future<List<CollectionCard>> deleteCard({
//     required String nameCollection,
//     required String heroType,
//     required CardByParams card,
//     String? cardId,
//   }) async {
//     String id = cardId ?? card.cardId!;
//     try {
//       var box = await hiveHelper.hiveBox;
//       List<HiveCollectionCard> cardsList = [];

//       final collectionsList = await _getHiveCollections(heroType);

//       final index = collectionsList.indexWhere(
//         (element) => element.nameCollection == nameCollection,
//       );

//       if (index != -1) {
//         cardsList = collectionsList[index].collectionCards ?? [];

//         final checkList = cardsList
//             .where((collectionCard) =>
//                 collectionCard.collectionCardId == id ||
//                 collectionCard.collectionCardId == '$id $id')
//             .toList();

//         if (cardId != null) {
//           cardsList.removeWhere((collectionCard) => collectionCard.collectionCardId == cardId);
//         } else {
//           if (checkList.isEmpty) {
//             throw const NoElementException();
//           }
//           cardsList.removeWhere((collectionCard) => checkList.length == 1
//               ? collectionCard.collectionCardId == id
//               : collectionCard.collectionCardId == '$id $id');
//         }

//         collectionsList[index] = HiveCollectionModel(
//           heroType: collectionsList[index].heroType,
//           nameCollection: collectionsList[index].nameCollection,
//           collectionCards: cardsList,
//         );
//       } else {
//         throw const NoElementException();
//       }

//       if (cardsList.isEmpty) {
//         collectionsList.removeWhere((element) => element.nameCollection == nameCollection);
//       }

//       await box.put(heroType, collectionsList.toDTOs());

//       return cardsList.toModels();
//     } catch (e) {
//       rethrow;
//     }
//   }

//   @override
//   Future<void> deleteCollection(String nameCollection, String heroType) async {
//     try {
//       var box = await hiveHelper.hiveBox;

//       final collectionsList = await _getHiveCollections(heroType);
//       if (collectionsList.isEmpty) {
//         throw const NoElementException();
//       }
//       collectionsList.removeWhere((element) => element.nameCollection == nameCollection);

//       await box.put(heroType, collectionsList.toDTOs());
//     } catch (e) {
//       rethrow;
//     }
//   }

//   @override
//   Future<List<CollectionCard>> getCollection(String nameCollection, String heroType) async {
//     try {
//       List<HiveCollectionCard> cardsList = [];
//       final collectionsList = await _getHiveCollections(heroType);
//       cardsList = collectionsList
//               .firstWhere((element) => element.nameCollection == nameCollection)
//               .collectionCards ??
//           [];

//       return cardsList.toModels();
//     } catch (e) {
//       throw UnimplementedError();
//     }
//   }

//   @override
//   Future<List<CollectionModel>> getCollections(String heroType) async {
//     try {
//       final collectionsList = await _getHiveCollections(heroType);

//       return collectionsList.toModels();
//     } catch (e) {
//       throw UnimplementedError();
//     }
//   }

//   @override
//   Future<List<String>> getNamesAllCollections(String heroType) async {
//     try {
//       final collectionsList = await _getHiveCollections(heroType);

//       return collectionsList.toModels().map((e) => e.nameCollection).toList();
//     } catch (e) {
//       throw UnimplementedError();
//     }
//   }

//   Future<List<HiveCollectionModel>> _getHiveCollections(String heroType) async {
//     try {
//       var box = await hiveHelper.hiveBox;
//       List<HiveCollectionModel> collectionsList = [];

//       List collections = await box.get(heroType, defaultValue: []);
//       if (collections.isNotEmpty) {
//         collectionsList = collections.map((e) => e as CollectionModelDTO).toList().toModels();
//       }
//       return collectionsList;
//     } catch (e) {
//       throw UnimplementedError();
//     }
//   }
// }
