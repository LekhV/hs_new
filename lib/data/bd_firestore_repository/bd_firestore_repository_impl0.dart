import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_hs/api/cards/dto/card_by_params_dto.dart';
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
      String nameCollection, CardByParams card, heroType) async {
    try {
      List<String> listName = await getCollection(nameCollection)
          .then((value) => value.map((e) => e.collectionCardId).toList());

      if (listName.isEmpty) {
        await setCard(
          nameCollection: nameCollection,
          card: card,
          documentName: card.cardId ?? '',
        );
      }

      if (listName.length > 10) {
        throw const CollectionLimitExceededException();
      }

      listName.map((e) {
        final isCheckCard = listName.firstWhere(
          (element) => element == card.cardId,
          orElse: () => '',
        );

        if (e == card.cardId) {
          setCard(
            nameCollection: nameCollection,
            card: card,
            documentName: '${card.cardId} ${card.cardId}',
          );
        } else if (e == '${card.cardId} ${card.cardId}' && isCheckCard.isNotEmpty) {
          throw const CardsLimitExceededException();
        } else {
          setCard(
            nameCollection: nameCollection,
            card: card,
            documentName: card.cardId ?? '',
          );
        }
      }).toList();
      // TODO: change in another version
      return [];
    } catch (e) {
      print("Failed to created Collection: $e");
      rethrow;
    }
  }

  @override
  Future<List<CollectionCard>> deleteCard(String nameCollection, String cardId) async {
    final String _token = await persistStorage.getStringForKey(USER_TOKEN) ?? 'token';

    final collectionUser = firestore.collection(mainCollection).doc(_token);
    final collection = collectionUser.collection(nameCollection);

    try {
      List<String> listName = await getCollection(nameCollection)
          .then((value) => value.map((e) => e.collectionCardId).toList());

      listName.map((e) async {
        if (e == cardId) {
          await collection.doc(cardId).delete().then((value) async {
            await _deleteCollection(nameCollection);
          });
        } else if ('$e $e' == '$cardId $cardId') {
          await collection.doc('$cardId $cardId').delete().then((value) async {
            await _deleteCollection(nameCollection);
          });
        }
      }).toList();
      // TODO: change in another version
      return [];
    } catch (e) {
      print("Failed to delete card: $e");
      throw const NetworkException();
    }
  }

  Future<void> _deleteCollection(String nameCollection) async {
    final String _token = await persistStorage.getStringForKey(USER_TOKEN) ?? 'token';

    final collectionUser = firestore.collection(mainCollection).doc(_token);

    try {
      List<String> listName = await getCollection(nameCollection)
          .then((value) => value.map((e) => e.collectionCardId).toList());

      if (listName.isEmpty) {
        await collectionUser.update({nameCollection: FieldValue.delete()});
      }
    } catch (e) {
      print("Failed to delete card: $e");
      throw const NetworkException();
    }
  }

  @override
  Future<List<CollectionCard>> getCollection(String nameCollection) async {
    final String _token = await persistStorage.getStringForKey(USER_TOKEN) ?? 'token';

    final collectionUser = firestore.collection(mainCollection).doc(_token);
    final collection = collectionUser.collection(nameCollection);
    try {
      return collection.get().then((value) {
        return value.docs.map((e) {
          final card = CardByParamsDTO.fromJson(e.data());
// TODO another
          return CollectionCard(
            cardByParams: card.toModel(),
            collectionCardId: e.id,
            heroType: '',
          );
        }).toList();
      });
    } catch (e) {
      print("Failed to get collection: $e");
      throw const NetworkException();
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
              (k, v) => list.add(
                CollectionsModel(
                  nameCollection: k,
                  // cardList: v,
                ),
              ),
            );

        return list;
      });
    } catch (e) {
      print("Failed to get collection: $e");
      throw const NetworkException();
    }
  }

  Future<void> setCard({
    required String nameCollection,
    required CardByParams card,
    required String documentName,
  }) async {
    final String _token = await persistStorage.getStringForKey(USER_TOKEN) ?? 'token';

    final collectionUser = firestore.collection(mainCollection).doc(_token);
    final collection = collectionUser.collection(nameCollection);

    final cardsRef = collection.doc(documentName).withConverter<CardByParamsDTO>(
          fromFirestore: (snapshot, _) => CardByParamsDTO.fromJson(snapshot.data()!),
          toFirestore: (card, _) => card.toJson(),
        );

    return cardsRef.set(card.toDTO()).then((value) async {
      final list = await getCollection(nameCollection);
      Map<String, dynamic> data = {nameCollection: list.length};

      try {
        return await collectionUser.update(data);
      } on FirebaseException catch (e) {
        if (e.code == 'not-found') {
          return await collectionUser.set(data);
        }
        throw const NetworkException();
      }
    });
  }

  @override
  Future<void> deleteCollection(String nameCollection) async {
    final String _token = await persistStorage.getStringForKey(USER_TOKEN) ?? 'token';

    final collectionUser = firestore.collection(mainCollection).doc(_token);
    final collection = collectionUser.collection(nameCollection);

    try {
      // TODO: delete collection in doc

      await collectionUser.update({nameCollection: FieldValue.delete()});
    } catch (e) {
      print("Failed to delete collection: $e");
      throw const NetworkException();
    }
  }
}
