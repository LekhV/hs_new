// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionCard _$CollectionCardFromJson(Map<String, dynamic> json) =>
    CollectionCard(
      collectionCardId: json['collectionCardId'] as String,
      card: CardByParams.fromJson(json['card'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CollectionCardToJson(CollectionCard instance) =>
    <String, dynamic>{
      'collectionCardId': instance.collectionCardId,
      'card': instance.card,
    };
