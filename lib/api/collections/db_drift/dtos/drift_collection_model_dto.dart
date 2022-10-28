import 'package:drift/drift.dart';

class DriftCollectionModelDTO extends Table {
  IntColumn get collectionModelId => integer().autoIncrement().nullable()();
  TextColumn get nameCollection => text().nullable()();
  TextColumn get heroType => text().nullable()();
  IntColumn get collectionCardsLenght => integer().nullable()();
}
