// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sqlite_collection_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SQLiteCollectionCard _$SQLiteCollectionCardFromJson(
        Map<String, dynamic> json) =>
    SQLiteCollectionCard(
      collectionCardId: json['collectionCardId'] as int?,
      card: json['card'] == null
          ? null
          : CardByParams.fromJson(json['card'] as Map<String, dynamic>),
      collectionModelId: json['collectionModelId'] as int?,
    );

Map<String, dynamic> _$SQLiteCollectionCardToJson(
        SQLiteCollectionCard instance) =>
    <String, dynamic>{
      'collectionCardId': instance.collectionCardId,
      'collectionModelId': instance.collectionModelId,
      'card': instance.card,
    };
