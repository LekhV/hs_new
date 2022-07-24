// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sql_collection_card_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SQLiteCollectionCardDTO _$SQLiteCollectionCardDTOFromJson(
        Map<String, dynamic> json) =>
    SQLiteCollectionCardDTO(
      collectionCardId: json['collectionCardId'] as int?,
      collectionModelId: json['collectionModelId'] as int?,
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

Map<String, dynamic> _$SQLiteCollectionCardDTOToJson(
        SQLiteCollectionCardDTO instance) =>
    <String, dynamic>{
      'collectionCardId': instance.collectionCardId,
      'collectionModelId': instance.collectionModelId,
      'artist': instance.artist,
      'attack': instance.attack,
      'cardId': instance.cardId,
      'cardSet': instance.cardSet,
      'collectible': instance.collectible,
      'cost': instance.cost,
      'dbfId': instance.dbfId,
      'elite': instance.elite,
      'faction': instance.faction,
      'flavor': instance.flavor,
      'health': instance.health,
      'img': instance.img,
      'imgGold': instance.imgGold,
      'locale': instance.locale,
      'name': instance.name,
      'playerClass': instance.playerClass,
      'rarity': instance.rarity,
      'text': instance.text,
      'type': instance.type,
    };
