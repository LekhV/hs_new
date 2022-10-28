// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_collection_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DriftCollectionModel _$DriftCollectionModelFromJson(
        Map<String, dynamic> json) =>
    DriftCollectionModel(
      nameCollection: json['nameCollection'] as String?,
      heroType: json['heroType'] as String?,
      id: json['id'] as int?,
      collectionCardsLenght: json['collectionCardsLenght'] as int?,
    );

Map<String, dynamic> _$DriftCollectionModelToJson(
        DriftCollectionModel instance) =>
    <String, dynamic>{
      'nameCollection': instance.nameCollection,
      'heroType': instance.heroType,
      'id': instance.id,
      'collectionCardsLenght': instance.collectionCardsLenght,
    };
