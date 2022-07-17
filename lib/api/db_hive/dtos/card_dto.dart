import 'package:hive/hive.dart';

part 'card_dto.g.dart';

@HiveType(typeId: 2)
class CardDTO extends HiveObject {
  CardDTO({
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

  @HiveField(0)
  String? cardId;

  @HiveField(1)
  String? dbfId;

  @HiveField(2)
  String? name;

  @HiveField(3)
  String? cardSet;

  @HiveField(4)
  String? type;

  @HiveField(5)
  String? faction;

  @HiveField(6)
  String? rarity;

  @HiveField(7)
  int? cost;

  @HiveField(8)
  int? attack;

  @HiveField(9)
  int? health;

  @HiveField(10)
  String? text;

  @HiveField(11)
  String? flavor;

  @HiveField(12)
  String? artist;

  @HiveField(13)
  bool? collectible;

  @HiveField(14)
  bool? elite;

  @HiveField(15)
  String? playerClass;

  @HiveField(16)
  String? img;

  @HiveField(17)
  String? imgGold;

  @HiveField(18)
  String? locale;
}
