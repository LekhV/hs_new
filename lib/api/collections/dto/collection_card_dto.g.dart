// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_card_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionCardDTO _$CollectionCardDTOFromJson(Map<String, dynamic> json) =>
    CollectionCardDTO(
      collectionCardId: json['collectionCardId'] as String,
      card: json['card'] as Map<String, dynamic>,
      heroType: json['heroType'] as String,
    );

Map<String, dynamic> _$CollectionCardDTOToJson(CollectionCardDTO instance) =>
    <String, dynamic>{
      'collectionCardId': instance.collectionCardId,
      'card': instance.card,
      'heroType': instance.heroType,
    };

CollectionCardsDTO _$CollectionCardsDTOFromJson(Map<String, dynamic> json) =>
    CollectionCardsDTO(
      collectionCardDTOList: (json['collectionCardDTOList'] as List<dynamic>)
          .map((e) => CollectionCardDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CollectionCardsDTOToJson(CollectionCardsDTO instance) =>
    <String, dynamic>{
      'collectionCardDTOList': instance.collectionCardDTOList,
    };
