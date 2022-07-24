import 'package:flutter_hs/domain/cards/models/card_by_params.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'db_collection_card_model.g.dart';

@JsonSerializable()
class CollectionCard {
  CollectionCard({
    required this.collectionCardId,
    required this.card,
  });
  dynamic collectionCardId;
  CardByParams card;

  factory CollectionCard.fromJson(Map<String, dynamic> json) => _$CollectionCardFromJson(json);
  Map<String, dynamic> toJson() => _$CollectionCardToJson(this);
}
