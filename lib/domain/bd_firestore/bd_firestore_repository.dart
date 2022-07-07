import 'package:flutter_hs/domain/cards/models/card_by_params.dart';

import 'models/collection_card_model.dart';
import 'models/collections_model.dart';

abstract class BDFirestoreRepository {
  Future<List<CollectionCard>> createCollection(
    String nameCollection,
    CardByParams card,
    String heroType,
  );
  Future<List<CollectionCard>> deleteCard(String nameCollection, String cardId);
  Future<void> deleteCollection(String nameCollection);

  Future<List<CollectionCard>> getCollection(String nameCollection);
  Future<List<CollectionsModel>> getCollections(String heroType);
}
