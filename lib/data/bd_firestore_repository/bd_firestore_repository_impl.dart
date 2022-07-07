import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_hs/api/collections/dto/collection_card_dto.dart';
import 'package:flutter_hs/config.dart';
import 'package:flutter_hs/data/bd_firestore_repository/mappers/mappers.dart';
import 'package:flutter_hs/domain/bd_firestore/bd_firestore_repository.dart';
import 'package:flutter_hs/domain/bd_firestore/models/collection_card_model.dart';
import 'package:flutter_hs/domain/bd_firestore/models/collections_model.dart';
import 'package:flutter_hs/domain/cards/models/card_by_params.dart';
import 'package:flutter_hs/domain/common/exceptions.dart';
import 'package:flutter_hs/utils/persist_storage.dart';

class BDFirestoreRepositoryImpl implements BDFirestoreRepository {
  final firestore = FirebaseFirestore.instance;
  final String mainCollection = config.mainCollection;

  @override
  Future<List<CollectionCard>> createCollection(
    String nameCollection,
    CardByParams card,
    String heroType,
  ) async {
    try {
      // final listCollection = await getCollections(heroType);

// TODO
      // final checkSameName = listCollection.firstWhere(
      //     (element) => element.nameCollection == nameCollection,
      //     orElse: () => CollectionsModel());

      // if (checkSameName.nameCollection != null) {
      //   throw const SameCardsException();
      // }

      List<CollectionCard> list = await getCollection(nameCollection);
      final checkList = list.where(
        (collectionCard) => collectionCard.collectionCardId == card.cardId,
      );
      if (list.length > 9) {
        throw const CollectionLimitExceededException();
      } else {
        if (checkList.length < 2) {
          list = await _setCard(
            nameCollection: nameCollection,
            card: card,
            list: list,
            heroType: heroType,
          );
        } else {
          throw const CardsLimitExceededException();
        }
      }
      return list;
    } catch (e) {
      print("Failed to created Collection: $e");
      rethrow;
    }
  }

  @override
  Future<List<CollectionCard>> deleteCard(String nameCollection, String cardId) async {
    final String _token = await persistStorage.getStringForKey(USER_TOKEN) ?? 'token';

    final collectionUser = firestore.collection(mainCollection).doc(_token);

    try {
      List<CollectionCard> list = await getCollection(nameCollection);

      final collectionCard = list.firstWhere(
        (element) => element.collectionCardId == cardId,
        orElse: () => CollectionCard(
          cardByParams: CardByParams(),
          collectionCardId: '',
          heroType: '',
        ),
      );

      if (collectionCard.collectionCardId.isEmpty) {
        throw const NoElementException();
      }
      list.remove(collectionCard);
      final newList = list.map((e) => e.toDTO().toJson()).toList();
      Map<String, dynamic> data = {nameCollection: newList};
      await collectionUser.update(data);

      if (list.isEmpty) {
        deleteCollection(nameCollection);
      }

      return list;
    } catch (error) {
      print("Failed to delete card: $error");
      rethrow;
    }
  }

  @override
  Future<List<CollectionsModel>> getCollections(String heroType) async {
    final String _token = await persistStorage.getStringForKey(USER_TOKEN) ?? 'token';
    final collectionUser = firestore.collection(mainCollection).doc(_token);

    try {
      return collectionUser.get().then((value) {
        List<CollectionsModel> list = [];

        value.data()!.forEach(
          (k, v) {
            List<CollectionCardDTO> dtos = List<CollectionCardDTO>.from(
              v.map((model) => CollectionCardDTO.fromJson(model)),
            );
            final collectionsModel = CollectionsModel(
              nameCollection: k,
              lenghtCollection: dtos.length,
            );
            if (heroType == dtos.first.heroType) {
              list.add(collectionsModel);
            }
          },
        );

        return list;
      });
    } catch (e) {
      print("Failed to get collection: $e");
      throw const NetworkException();
    }
  }

  Future<List<CollectionCard>> _setCard({
    required String nameCollection,
    required CardByParams card,
    required List<CollectionCard> list,
    required String heroType,
  }) async {
    final String _token = await persistStorage.getStringForKey(USER_TOKEN) ?? 'token';
    final collectionUser = firestore.collection(mainCollection).doc(_token);

    final collectionCard = CollectionCard(
      cardByParams: card,
      collectionCardId: card.cardId ?? '',
      heroType: heroType,
    );
    list.add(collectionCard);
    final newList = list.map((e) => e.toDTO().toJson()).toList();
    Map<String, dynamic> data = {nameCollection: newList};

    try {
      await collectionUser.update(data);
      return list;
    } on FirebaseException catch (e) {
      if (e.code == 'not-found') {
        await collectionUser.set(data);
        return list;
      }
      throw const NetworkException();
    }
  }

  @override
  Future<void> deleteCollection(String nameCollection) async {
    final String _token = await persistStorage.getStringForKey(USER_TOKEN) ?? 'token';

    final collectionUser = firestore.collection(mainCollection).doc(_token);

    try {
      await collectionUser.update({nameCollection: FieldValue.delete()});
    } catch (e) {
      print("Failed to delete collection: $e");
      throw const NetworkException();
    }
  }

  @override
  Future<List<CollectionCard>> getCollection(String nameCollection) async {
    final String _token = await persistStorage.getStringForKey(USER_TOKEN) ?? 'token';

    final collectionUser = firestore.collection(mainCollection).doc(_token);
    try {
      return collectionUser.get().then((value) {
        List<CollectionCard> list = [];

        if (value.exists) {
          final containsKey = value.data()!.containsKey(nameCollection);

          if (containsKey) {
            final l = value.data()![nameCollection];

            List<CollectionCardDTO> dtos =
                List<CollectionCardDTO>.from(l.map((model) => CollectionCardDTO.fromJson(model)));

            list = dtos.toModels();
          }
        }
        return list;
      });
    } catch (e) {
      print("Failed to get collection: $e");
      throw const NetworkException();
    }
  }
}
