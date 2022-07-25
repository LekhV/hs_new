import 'package:flutter_hs/domain/cards/models/card_by_params.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sqlite_collection_card.g.dart';

@JsonSerializable()
class SQLiteCollectionCard {
  SQLiteCollectionCard({
    this.collectionCardId,
    this.card,
    this.collectionModelId,
  });

  final int? collectionCardId;
  final int? collectionModelId;

  final CardByParams? card;

  factory SQLiteCollectionCard.fromJson(Map<String, dynamic> json) =>
      _$SQLiteCollectionCardFromJson(json);
  Map<String, dynamic> toJson() => _$SQLiteCollectionCardToJson(this);
}
