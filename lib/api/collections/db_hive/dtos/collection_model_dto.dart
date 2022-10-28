import 'package:hive/hive.dart';

import 'collection_card_dto.dart';

part 'collection_model_dto.g.dart';

@HiveType(typeId: 0)
class CollectionModelDTO extends HiveObject {
  CollectionModelDTO({
    required this.nameCollection,
    required this.heroType,
    this.collectionCards,
  });

  @HiveField(0)
  final String nameCollection;
  @HiveField(1)
  final String heroType;
  @HiveField(2)
  List<CollectionCardDTO>? collectionCards;
}
