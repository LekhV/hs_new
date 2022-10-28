import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sql_collection_card_dto.g.dart';

@JsonSerializable()
class SQLiteCollectionCardDTO {
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
  @override
  Map<String, dynamic> toJson() => _$SQLiteCollectionCardDTOToJson(this);

  final String? artist;

  final int? attack;

  final String? cardId;

  final String? cardSet;

  final int? cost;

  final String? dbfId;

  final int? collectible;

  final int? elite;

  final String? faction;

  final String? flavor;

  final int? health;

  final String? img;

  final String? imgGold;

  final String? locale;

  final String? name;

  final String? playerClass;

  final String? rarity;

  final String? text;

  final String? type;
}
