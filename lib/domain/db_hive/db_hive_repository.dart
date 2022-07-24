import 'package:flutter_hs/domain/cards/models/card_by_params.dart';
import 'package:flutter_hs/domain/collections/models/db_collection_card_model.dart';

import '../collections/models/db_collection_model.dart';

abstract class DBHiveRepository {
  Future<List<CollectionCard>> createCollection(
    String nameCollection,
    CardByParams card,
    String heroType,
  );
  Future<List<CollectionCard>> deleteCard({
    required String nameCollection,
    required String heroType,
    required CardByParams card,
    String? cardId,
  });
  Future<void> deleteCollection(String nameCollection, String heroType);

  Future<List<CollectionCard>> getCollection(String nameCollection, String heroType);
  Future<List<CollectionModel>> getCollections(String heroType);
}
