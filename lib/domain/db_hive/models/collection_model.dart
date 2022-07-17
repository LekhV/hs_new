import 'package:json_annotation/json_annotation.dart';

import 'collection_card_model.dart';

part 'collection_model.g.dart';

@JsonSerializable()
class CollectionModel {
  CollectionModel({
    required this.nameCollection,
    required this.heroType,
    this.collectionCards,
  });

  final String nameCollection;
  final String heroType;
  final List<CollectionCard>? collectionCards;

  factory CollectionModel.fromJson(Map<String, dynamic> json) => _$CollectionModelFromJson(json);
  Map<String, dynamic> toJson() => _$CollectionModelToJson(this);
}
