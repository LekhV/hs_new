// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_by_params_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardByParamsDTO _$CardByParamsDTOFromJson(Map<String, dynamic> json) =>
    CardByParamsDTO(
      cardId: json['cardId'] as String?,
      dbfId: json['dbfId'] as String?,
      name: json['name'] as String?,
      cardSet: json['cardSet'] as String?,
      type: json['type'] as String?,
      faction: json['faction'] as String?,
      rarity: json['rarity'] as String?,
      cost: json['cost'] as int?,
      attack: json['attack'] as int?,
      health: json['health'] as int?,
      text: json['text'] as String?,
      flavor: json['flavor'] as String?,
      artist: json['artist'] as String?,
      collectible: json['collectible'] as bool?,
      elite: json['elite'] as bool?,
      playerClass: json['playerClass'] as String?,
      img: json['img'] as String?,
      imgGold: json['imgGold'] as String?,
      locale: json['locale'] as String?,
    );

Map<String, dynamic> _$CardByParamsDTOToJson(CardByParamsDTO instance) =>
    <String, dynamic>{
      'cardId': instance.cardId,
      'dbfId': instance.dbfId,
      'name': instance.name,
      'cardSet': instance.cardSet,
      'type': instance.type,
      'faction': instance.faction,
      'rarity': instance.rarity,
      'cost': instance.cost,
      'attack': instance.attack,
      'health': instance.health,
      'text': instance.text,
      'flavor': instance.flavor,
      'artist': instance.artist,
      'collectible': instance.collectible,
      'elite': instance.elite,
      'playerClass': instance.playerClass,
      'img': instance.img,
      'imgGold': instance.imgGold,
      'locale': instance.locale,
    };
