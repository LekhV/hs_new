import 'package:hive/hive.dart';

import 'card_dto.dart';

part 'collection_card_dto.g.dart';

@HiveType(typeId: 1)
class CollectionCardDTO extends HiveObject {
  CollectionCardDTO({
    required this.collectionCardId,
    required this.card,
  });
  @HiveField(0)
  String collectionCardId;
  @HiveField(1)
  CardDTO card;
}
