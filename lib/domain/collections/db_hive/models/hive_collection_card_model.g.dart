// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_collection_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HiveCollectionCard _$HiveCollectionCardFromJson(Map<String, dynamic> json) =>
    HiveCollectionCard(
      collectionCardId: json['collectionCardId'] as String,
      card: CardByParams.fromJson(json['card'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HiveCollectionCardToJson(HiveCollectionCard instance) =>
    <String, dynamic>{
      'collectionCardId': instance.collectionCardId,
      'card': instance.card,
    };
