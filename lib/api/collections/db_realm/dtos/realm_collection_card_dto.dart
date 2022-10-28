import 'package:realm/realm.dart';

part 'realm_collection_card_dto.g.dart';

@RealmModel()
class $RealmCollectionCardDTO {
  late final String collectionCardId;
  late final String collectionId;

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
