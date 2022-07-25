import 'package:json_annotation/json_annotation.dart';

import 'hive_collection_card_model.dart';

part 'hive_collection_model.g.dart';

@JsonSerializable()
class HiveCollectionModel {
  HiveCollectionModel({
    required this.nameCollection,
    required this.heroType,
    this.collectionCards,
  });

  final String nameCollection;
  final String heroType;
  final List<HiveCollectionCard>? collectionCards;

  factory HiveCollectionModel.fromJson(Map<String, dynamic> json) =>
      _$HiveCollectionModelFromJson(json);
  Map<String, dynamic> toJson() => _$HiveCollectionModelToJson(this);
}
