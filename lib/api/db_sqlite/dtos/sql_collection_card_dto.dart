import 'package:flutter_hs/domain/cards/models/card_by_params.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sql_collection_card_dto.g.dart';

@JsonSerializable()
class SQLiteCollectionCardDTO implements CardByParams {
  final int? collectionCardId;
  final int? collectionModelId;

  SQLiteCollectionCardDTO({
    this.collectionCardId,
    this.collectionModelId,
    this.cardId,
    this.dbfId,
    this.name,
    this.cardSet,
    this.type,
    this.faction,
    this.rarity,
    this.cost,
    this.attack,
    this.health,
    this.text,
    this.flavor,
    this.artist,
    this.collectible,
    this.elite,
    this.playerClass,
    this.img,
    this.imgGold,
    this.locale,
  });

  factory SQLiteCollectionCardDTO.fromJson(Map<String, dynamic> json) =>
      _$SQLiteCollectionCardDTOFromJson(json);
  Map<String, dynamic> toJson() => _$SQLiteCollectionCardDTOToJson(this);

  @override
  String? artist;

  @override
  int? attack;

  @override
  String? cardId;

  @override
  String? cardSet;

  @override
  bool? collectible;

  @override
  int? cost;

  @override
  String? dbfId;

  @override
  bool? elite;

  @override
  String? faction;

  @override
  String? flavor;

  @override
  int? health;

  @override
  String? img;

  @override
  String? imgGold;

  @override
  String? locale;

  @override
  String? name;

  @override
  String? playerClass;

  @override
  String? rarity;

  @override
  String? text;

  @override
  String? type;
}
