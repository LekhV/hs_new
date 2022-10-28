import 'package:realm/realm.dart';

import 'realm_collection_card_dto.dart';

part 'realm_collection_model_dto.g.dart';

@RealmModel()
class $RealmCollectionModelDTO {
  @PrimaryKey()
  late final String nameCollection;

  String? heroType;
  List<$RealmCollectionCardDTO> collectionCards = [];
}
