// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_collection_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HiveCollectionModel _$HiveCollectionModelFromJson(Map<String, dynamic> json) =>
    HiveCollectionModel(
      nameCollection: json['nameCollection'] as String,
      heroType: json['heroType'] as String,
      collectionCards: (json['collectionCards'] as List<dynamic>?)
          ?.map((e) => HiveCollectionCard.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HiveCollectionModelToJson(
        HiveCollectionModel instance) =>
    <String, dynamic>{
      'nameCollection': instance.nameCollection,
      'heroType': instance.heroType,
      'collectionCards': instance.collectionCards,
    };
