// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_collection_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DriftCollectionCard _$DriftCollectionCardFromJson(Map<String, dynamic> json) =>
    DriftCollectionCard(
      collectionCardId: json['collectionCardId'] as int?,
      card: json['card'] == null
          ? null
          : CardByParams.fromJson(json['card'] as Map<String, dynamic>),
      collectionModelId: json['collectionModelId'] as int?,
    );

Map<String, dynamic> _$DriftCollectionCardToJson(
        DriftCollectionCard instance) =>
    <String, dynamic>{
      'collectionCardId': instance.collectionCardId,
      'collectionModelId': instance.collectionModelId,
      'card': instance.card,
    };
