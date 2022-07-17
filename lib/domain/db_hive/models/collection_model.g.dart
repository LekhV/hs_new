// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionModel _$CollectionModelFromJson(Map<String, dynamic> json) =>
    CollectionModel(
      nameCollection: json['nameCollection'] as String,
      heroType: json['heroType'] as String,
      collectionCards: (json['collectionCards'] as List<dynamic>?)
          ?.map((e) => CollectionCard.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CollectionModelToJson(CollectionModel instance) =>
    <String, dynamic>{
      'nameCollection': instance.nameCollection,
      'heroType': instance.heroType,
      'collectionCards': instance.collectionCards,
    };
