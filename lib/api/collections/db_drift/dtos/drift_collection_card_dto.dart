import 'package:drift/drift.dart';

class DriftCollectionCardDTO extends Table {
  IntColumn get collectionCardId => integer().autoIncrement().nullable()();
  IntColumn get collectionModelId => integer().nullable()();

  TextColumn get artist => text().nullable()();
  TextColumn get cardId => text().nullable()();
  IntColumn get attack => integer().nullable()();
  TextColumn get cardSet => text().nullable()();
  IntColumn get cost => integer().nullable()();
  TextColumn get dbfId => text().nullable()();
  BoolColumn get collectible => boolean().nullable()();
  BoolColumn get elite => boolean().nullable()();
  TextColumn get faction => text().nullable()();
  TextColumn get flavor => text().nullable()();
  IntColumn get health => integer().nullable()();
  TextColumn get img => text().nullable()();
  TextColumn get imgGold => text().nullable()();
  TextColumn get locale => text().nullable()();
  TextColumn get name => text().nullable()();
  TextColumn get playerClass => text().nullable()();
  TextColumn get rarity => text().nullable()();
  TextColumn get textContent => text().named('text').nullable()();
  TextColumn get type => text().nullable()();
}
