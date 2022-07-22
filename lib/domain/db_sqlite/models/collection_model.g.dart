// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionModel _$CollectionModelFromJson(Map<String, dynamic> json) =>
    CollectionModel(
      nameCollection: json['nameCollection'] as String?,
      heroType: json['heroType'] as String?,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$CollectionModelToJson(CollectionModel instance) =>
    <String, dynamic>{
      'nameCollection': instance.nameCollection,
      'heroType': instance.heroType,
      'id': instance.id,
    };
