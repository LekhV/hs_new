import 'package:flutter_hs/api/collections/db_realm/dtos/realm_card_dto.dart';
import 'package:realm/realm.dart';

part 'realm_collection_card_dto.g.dart';

@RealmModel()
class $RealmCollectionCardDTO {
  // @PrimaryKey()
  late final String collectionCardId;

  //@MapTo('card')
  $RealmCardDTO? card;
}
