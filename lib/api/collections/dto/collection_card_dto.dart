import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'collection_card_dto.g.dart';

@JsonSerializable()
class CollectionCardDTO {
  CollectionCardDTO({
    required this.collectionCardId,
    required this.card,
    required this.heroType,
  });
  String collectionCardId;
  Map<String, dynamic> card;
  String heroType;
  //CardByParamsDTO cardByParamsDTO;

  factory CollectionCardDTO.fromJson(Map<String, dynamic> json) =>
      _$CollectionCardDTOFromJson(json);
  Map<String, dynamic> toJson() => _$CollectionCardDTOToJson(this);
}

@JsonSerializable()
class CollectionCardsDTO {
  CollectionCardsDTO({
    required this.collectionCardDTOList,
  });

  List<CollectionCardDTO> collectionCardDTOList;

  factory CollectionCardsDTO.fromJson(Map<String, dynamic> json) =>
      _$CollectionCardsDTOFromJson(json);
  Map<String, dynamic> toJson() => _$CollectionCardsDTOToJson(this);
}
