// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cardback.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardBack _$CardBackFromJson(Map<String, dynamic> json) => CardBack(
      cardBackId: json['cardBackId'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      source: json['source'] as String?,
      howToGet: json['howToGet'] as String?,
      enabled: json['enabled'] as bool?,
      img: json['img'] as String?,
      imgAnimated: json['imgAnimated'] as String?,
      sortCategory: json['sortCategory'] as String?,
      sortOrder: json['sortOrder'] as String?,
      locale: json['locale'] as String?,
    );

Map<String, dynamic> _$CardBackToJson(CardBack instance) => <String, dynamic>{
      'cardBackId': instance.cardBackId,
      'name': instance.name,
      'description': instance.description,
      'source': instance.source,
      'howToGet': instance.howToGet,
      'enabled': instance.enabled,
      'img': instance.img,
      'imgAnimated': instance.imgAnimated,
      'sortCategory': instance.sortCategory,
      'sortOrder': instance.sortOrder,
      'locale': instance.locale,
    };
