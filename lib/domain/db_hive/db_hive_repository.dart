import 'package:flutter_hs/domain/cards/models/card_by_params.dart';

import 'models/collection_card_model.dart';
import 'models/collection_model.dart';

abstract class DBHiveRepository {
  Future<List<CollectionCard>> createCollection(
    String nameCollection,
    CardByParams card,
    String heroType,
  );
  Future<List<CollectionCard>> deleteCard(
    String nameCollection,
    String cardId,
    String heroType,
  );
  Future<void> deleteCollection(String nameCollection, String heroType);

  Future<List<CollectionCard>> getCollection(String nameCollection, String heroType);
  Future<List<CollectionModel>> getCollections(String heroType);
}
