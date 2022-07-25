import 'package:flutter_hs/domain/cards/models/card_by_params.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hive_collection_card_model.g.dart';

@JsonSerializable()
class HiveCollectionCard {
  HiveCollectionCard({
    required this.collectionCardId,
    required this.card,
  });
  String collectionCardId;
  CardByParams card;

  factory HiveCollectionCard.fromJson(Map<String, dynamic> json) =>
      _$HiveCollectionCardFromJson(json);
  Map<String, dynamic> toJson() => _$HiveCollectionCardToJson(this);
}
