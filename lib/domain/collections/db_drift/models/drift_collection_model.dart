import 'package:json_annotation/json_annotation.dart';

part 'drift_collection_model.g.dart';

@JsonSerializable()
class DriftCollectionModel {
  DriftCollectionModel({
    this.nameCollection,
    this.heroType,
    this.id,
    this.collectionCardsLenght,
  });

  final String? nameCollection;
  final String? heroType;
  final int? id;
  final int? collectionCardsLenght;

  factory DriftCollectionModel.fromJson(Map<String, dynamic> json) =>
      _$DriftCollectionModelFromJson(json);
  Map<String, dynamic> toJson() => _$DriftCollectionModelToJson(this);
}
