import 'package:realm/realm.dart';

part 'realm_card_dto.g.dart';

@RealmModel()
class $RealmCardDTO {
  String? cardId;

  String? dbfId;
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
