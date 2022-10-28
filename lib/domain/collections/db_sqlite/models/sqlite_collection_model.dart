import 'package:json_annotation/json_annotation.dart';

part 'sqlite_collection_model.g.dart';

@JsonSerializable()
class SQLiteCollectionModel {
  SQLiteCollectionModel({
    this.nameCollection,
    this.heroType,
    this.id,
    this.collectionCardsLenght,
  });

  final String? nameCollection;
  final String? heroType;
  final int? id;
  final int? collectionCardsLenght;

  factory SQLiteCollectionModel.fromJson(Map<String, dynamic> json) =>
      _$SQLiteCollectionModelFromJson(json);
  Map<String, dynamic> toJson() => _$SQLiteCollectionModelToJson(this);
}
