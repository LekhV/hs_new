import 'package:flutter_hs/domain/db_hive/models/hive_collection_card_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'db_collection_model.g.dart';

@JsonSerializable()
class CollectionModel {
  CollectionModel({
    required this.nameCollection,
    required this.heroType,
    this.collectionCardsLenght,
  });

  final String nameCollection;
  final String heroType;
  final int? collectionCardsLenght;

  factory CollectionModel.fromJson(Map<String, dynamic> json) => _$CollectionModelFromJson(json);
  Map<String, dynamic> toJson() => _$CollectionModelToJson(this);
}
