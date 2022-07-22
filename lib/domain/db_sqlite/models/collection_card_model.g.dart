// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionCard _$CollectionCardFromJson(Map<String, dynamic> json) =>
    CollectionCard(
      collectionCardId: json['collectionCardId'] as int?,
      card: json['card'] == null
          ? null
          : CardByParams.fromJson(json['card'] as Map<String, dynamic>),
      collectionModelId: json['collectionModelId'] as int?,
    );

Map<String, dynamic> _$CollectionCardToJson(CollectionCard instance) =>
    <String, dynamic>{
      'collectionCardId': instance.collectionCardId,
      'collectionModelId': instance.collectionModelId,
      'card': instance.card,
    };
