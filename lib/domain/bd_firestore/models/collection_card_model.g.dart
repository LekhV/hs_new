// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionCard _$CollectionCardFromJson(Map<String, dynamic> json) =>
    CollectionCard(
      collectionCardId: json['collectionCardId'] as String,
      cardByParams:
          CardByParams.fromJson(json['cardByParams'] as Map<String, dynamic>),
      heroType: json['heroType'] as String,
    );

Map<String, dynamic> _$CollectionCardToJson(CollectionCard instance) =>
    <String, dynamic>{
      'collectionCardId': instance.collectionCardId,
      'cardByParams': instance.cardByParams,
      'heroType': instance.heroType,
    };
