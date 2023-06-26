import 'package:json_annotation/json_annotation.dart';

part 'card_by_params.g.dart';

@JsonSerializable()
class CardByParams {
  CardByParams({
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
    //this.mechanics,
  });

  String? cardId;
  int? dbfId;
  String? name;
  String? cardSet;
  String? type;
  String? faction;
  String? rarity;
  int? cost;
  int? attack;
  int? health;
  String? text;
  String? flavor;
  String? artist;
  bool? collectible;
  bool? elite;
  String? playerClass;
  String? img;
  String? imgGold;
  String? locale;
}
