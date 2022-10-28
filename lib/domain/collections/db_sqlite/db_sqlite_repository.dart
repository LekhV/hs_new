import 'package:flutter_hs/domain/cards/models/card_by_params.dart';
import 'package:flutter_hs/domain/collections/models/db_collection_card_model.dart';
import 'package:flutter_hs/domain/collections/models/db_collection_model.dart';

abstract class DBSQLiteRepository {
  Future<List<CollectionCard>> createCollection(
    String nameCollection,
    CardByParams card,
    String heroType,
  );
  Future<List<CollectionCard>> deleteCard({
    required String nameCollection,
    required String heroType,
    required CardByParams card,
    int? cardId,
  });
  Future<void> deleteCollection(String nameCollection, String heroType);

  Future<List<CollectionCard>> getCollection(String nameCollection, String heroType);
  Future<List<CollectionModel>> getCollections(String heroType);

  Future<List<String>> getNamesAllCollections(String heroType);

  Future<List<CollectionCard>> getCardsByFilter(
    String nameCollection,
    String heroType,
    List<int> selectedCoins,
  );
}
