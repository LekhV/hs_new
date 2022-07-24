// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sqlite_collection_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SQLiteCollectionModel _$SQLiteCollectionModelFromJson(
        Map<String, dynamic> json) =>
    SQLiteCollectionModel(
      nameCollection: json['nameCollection'] as String?,
      heroType: json['heroType'] as String?,
      id: json['id'] as int?,
      collectionCardsLenght: json['collectionCardsLenght'] as int?,
    );

Map<String, dynamic> _$SQLiteCollectionModelToJson(
        SQLiteCollectionModel instance) =>
    <String, dynamic>{
      'nameCollection': instance.nameCollection,
      'heroType': instance.heroType,
      'id': instance.id,
      'collectionCardsLenght': instance.collectionCardsLenght,
    };
