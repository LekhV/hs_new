// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_collection_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionModel _$CollectionModelFromJson(Map<String, dynamic> json) =>
    CollectionModel(
      nameCollection: json['nameCollection'] as String,
      heroType: json['heroType'] as String,
      collectionCardsLenght: json['collectionCardsLenght'] as int?,
    );

Map<String, dynamic> _$CollectionModelToJson(CollectionModel instance) =>
    <String, dynamic>{
      'nameCollection': instance.nameCollection,
      'heroType': instance.heroType,
      'collectionCardsLenght': instance.collectionCardsLenght,
    };
