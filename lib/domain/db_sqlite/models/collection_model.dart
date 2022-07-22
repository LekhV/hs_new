import 'package:json_annotation/json_annotation.dart';

import 'collection_card_model.dart';

part 'collection_model.g.dart';

@JsonSerializable()
class CollectionModel {
  CollectionModel({
     this.nameCollection,
     this.heroType,
     this.id,
    //required this.collectionCards,
  });

  final String? nameCollection;
  final String? heroType;
  final int? id;
  //final String collectionCards;
  //final Map<String, Object> collectionCards;
  //final List<CollectionCard> collectionCards;

  factory CollectionModel.fromJson(Map<String, dynamic> json) => _$CollectionModelFromJson(json);
  Map<String, dynamic> toJson() => _$CollectionModelToJson(this);
}

// @JsonSerializable()
// class CollectionCardList {
//   final List<Map<String, Object>>? collectionCards;

//   CollectionCardList(this.collectionCards);

//   factory CollectionCardList.fromJson(Map<String, Object> json) =>
//       _$CollectionCardListFromJson(json);
// }
