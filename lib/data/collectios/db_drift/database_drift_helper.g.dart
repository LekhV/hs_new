// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_drift_helper.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class DriftCollectionCardDTOData extends DataClass
    implements Insertable<DriftCollectionCardDTOData> {
  final int? collectionCardId;
  final int? collectionModelId;
  final String? artist;
  final String? cardId;
  final int? attack;
  final String? cardSet;
  final int? cost;
  final String? dbfId;
  final bool? collectible;
  final bool? elite;
  final String? faction;
  final String? flavor;
  final int? health;
  final String? img;
  final String? imgGold;
  final String? locale;
  final String? name;
  final String? playerClass;
  final String? rarity;
  final String? textContent;
  final String? type;
  DriftCollectionCardDTOData(
      {this.collectionCardId,
      this.collectionModelId,
      this.artist,
      this.cardId,
      this.attack,
      this.cardSet,
      this.cost,
      this.dbfId,
      this.collectible,
      this.elite,
      this.faction,
      this.flavor,
      this.health,
      this.img,
      this.imgGold,
      this.locale,
      this.name,
      this.playerClass,
      this.rarity,
      this.textContent,
      this.type});
  factory DriftCollectionCardDTOData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DriftCollectionCardDTOData(
      collectionCardId: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}collection_card_id']),
      collectionModelId: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}collection_model_id']),
      artist: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}artist']),
      cardId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}card_id']),
      attack: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}attack']),
      cardSet: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}card_set']),
      cost: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}cost']),
      dbfId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}dbf_id']),
      collectible: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}collectible']),
      elite: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}elite']),
      faction: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}faction']),
      flavor: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}flavor']),
      health: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}health']),
      img: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}img']),
      imgGold: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}img_gold']),
      locale: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}locale']),
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name']),
      playerClass: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}player_class']),
      rarity: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}rarity']),
      textContent: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}text']),
      type: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}type']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || collectionCardId != null) {
      map['collection_card_id'] = Variable<int?>(collectionCardId);
    }
    if (!nullToAbsent || collectionModelId != null) {
      map['collection_model_id'] = Variable<int?>(collectionModelId);
    }
    if (!nullToAbsent || artist != null) {
      map['artist'] = Variable<String?>(artist);
    }
    if (!nullToAbsent || cardId != null) {
      map['card_id'] = Variable<String?>(cardId);
    }
    if (!nullToAbsent || attack != null) {
      map['attack'] = Variable<int?>(attack);
    }
    if (!nullToAbsent || cardSet != null) {
      map['card_set'] = Variable<String?>(cardSet);
    }
    if (!nullToAbsent || cost != null) {
      map['cost'] = Variable<int?>(cost);
    }
    if (!nullToAbsent || dbfId != null) {
      map['dbf_id'] = Variable<String?>(dbfId);
    }
    if (!nullToAbsent || collectible != null) {
      map['collectible'] = Variable<bool?>(collectible);
    }
    if (!nullToAbsent || elite != null) {
      map['elite'] = Variable<bool?>(elite);
    }
    if (!nullToAbsent || faction != null) {
      map['faction'] = Variable<String?>(faction);
    }
    if (!nullToAbsent || flavor != null) {
      map['flavor'] = Variable<String?>(flavor);
    }
    if (!nullToAbsent || health != null) {
      map['health'] = Variable<int?>(health);
    }
    if (!nullToAbsent || img != null) {
      map['img'] = Variable<String?>(img);
    }
    if (!nullToAbsent || imgGold != null) {
      map['img_gold'] = Variable<String?>(imgGold);
    }
    if (!nullToAbsent || locale != null) {
      map['locale'] = Variable<String?>(locale);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String?>(name);
    }
    if (!nullToAbsent || playerClass != null) {
      map['player_class'] = Variable<String?>(playerClass);
    }
    if (!nullToAbsent || rarity != null) {
      map['rarity'] = Variable<String?>(rarity);
    }
    if (!nullToAbsent || textContent != null) {
      map['text'] = Variable<String?>(textContent);
    }
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String?>(type);
    }
    return map;
  }

  DriftCollectionCardDTOCompanion toCompanion(bool nullToAbsent) {
    return DriftCollectionCardDTOCompanion(
      collectionCardId: collectionCardId == null && nullToAbsent
          ? const Value.absent()
          : Value(collectionCardId),
      collectionModelId: collectionModelId == null && nullToAbsent
          ? const Value.absent()
          : Value(collectionModelId),
      artist:
          artist == null && nullToAbsent ? const Value.absent() : Value(artist),
      cardId:
          cardId == null && nullToAbsent ? const Value.absent() : Value(cardId),
      attack:
          attack == null && nullToAbsent ? const Value.absent() : Value(attack),
      cardSet: cardSet == null && nullToAbsent
          ? const Value.absent()
          : Value(cardSet),
      cost: cost == null && nullToAbsent ? const Value.absent() : Value(cost),
      dbfId:
          dbfId == null && nullToAbsent ? const Value.absent() : Value(dbfId),
      collectible: collectible == null && nullToAbsent
          ? const Value.absent()
          : Value(collectible),
      elite:
          elite == null && nullToAbsent ? const Value.absent() : Value(elite),
      faction: faction == null && nullToAbsent
          ? const Value.absent()
          : Value(faction),
      flavor:
          flavor == null && nullToAbsent ? const Value.absent() : Value(flavor),
      health:
          health == null && nullToAbsent ? const Value.absent() : Value(health),
      img: img == null && nullToAbsent ? const Value.absent() : Value(img),
      imgGold: imgGold == null && nullToAbsent
          ? const Value.absent()
          : Value(imgGold),
      locale:
          locale == null && nullToAbsent ? const Value.absent() : Value(locale),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      playerClass: playerClass == null && nullToAbsent
          ? const Value.absent()
          : Value(playerClass),
      rarity:
          rarity == null && nullToAbsent ? const Value.absent() : Value(rarity),
      textContent: textContent == null && nullToAbsent
          ? const Value.absent()
          : Value(textContent),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
    );
  }

  factory DriftCollectionCardDTOData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DriftCollectionCardDTOData(
      collectionCardId: serializer.fromJson<int?>(json['collectionCardId']),
      collectionModelId: serializer.fromJson<int?>(json['collectionModelId']),
      artist: serializer.fromJson<String?>(json['artist']),
      cardId: serializer.fromJson<String?>(json['cardId']),
      attack: serializer.fromJson<int?>(json['attack']),
      cardSet: serializer.fromJson<String?>(json['cardSet']),
      cost: serializer.fromJson<int?>(json['cost']),
      dbfId: serializer.fromJson<String?>(json['dbfId']),
      collectible: serializer.fromJson<bool?>(json['collectible']),
      elite: serializer.fromJson<bool?>(json['elite']),
      faction: serializer.fromJson<String?>(json['faction']),
      flavor: serializer.fromJson<String?>(json['flavor']),
      health: serializer.fromJson<int?>(json['health']),
      img: serializer.fromJson<String?>(json['img']),
      imgGold: serializer.fromJson<String?>(json['imgGold']),
      locale: serializer.fromJson<String?>(json['locale']),
      name: serializer.fromJson<String?>(json['name']),
      playerClass: serializer.fromJson<String?>(json['playerClass']),
      rarity: serializer.fromJson<String?>(json['rarity']),
      textContent: serializer.fromJson<String?>(json['textContent']),
      type: serializer.fromJson<String?>(json['type']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'collectionCardId': serializer.toJson<int?>(collectionCardId),
      'collectionModelId': serializer.toJson<int?>(collectionModelId),
      'artist': serializer.toJson<String?>(artist),
      'cardId': serializer.toJson<String?>(cardId),
      'attack': serializer.toJson<int?>(attack),
      'cardSet': serializer.toJson<String?>(cardSet),
      'cost': serializer.toJson<int?>(cost),
      'dbfId': serializer.toJson<String?>(dbfId),
      'collectible': serializer.toJson<bool?>(collectible),
      'elite': serializer.toJson<bool?>(elite),
      'faction': serializer.toJson<String?>(faction),
      'flavor': serializer.toJson<String?>(flavor),
      'health': serializer.toJson<int?>(health),
      'img': serializer.toJson<String?>(img),
      'imgGold': serializer.toJson<String?>(imgGold),
      'locale': serializer.toJson<String?>(locale),
      'name': serializer.toJson<String?>(name),
      'playerClass': serializer.toJson<String?>(playerClass),
      'rarity': serializer.toJson<String?>(rarity),
      'textContent': serializer.toJson<String?>(textContent),
      'type': serializer.toJson<String?>(type),
    };
  }

  DriftCollectionCardDTOData copyWith(
          {int? collectionCardId,
          int? collectionModelId,
          String? artist,
          String? cardId,
          int? attack,
          String? cardSet,
          int? cost,
          String? dbfId,
          bool? collectible,
          bool? elite,
          String? faction,
          String? flavor,
          int? health,
          String? img,
          String? imgGold,
          String? locale,
          String? name,
          String? playerClass,
          String? rarity,
          String? textContent,
          String? type}) =>
      DriftCollectionCardDTOData(
        collectionCardId: collectionCardId ?? this.collectionCardId,
        collectionModelId: collectionModelId ?? this.collectionModelId,
        artist: artist ?? this.artist,
        cardId: cardId ?? this.cardId,
        attack: attack ?? this.attack,
        cardSet: cardSet ?? this.cardSet,
        cost: cost ?? this.cost,
        dbfId: dbfId ?? this.dbfId,
        collectible: collectible ?? this.collectible,
        elite: elite ?? this.elite,
        faction: faction ?? this.faction,
        flavor: flavor ?? this.flavor,
        health: health ?? this.health,
        img: img ?? this.img,
        imgGold: imgGold ?? this.imgGold,
        locale: locale ?? this.locale,
        name: name ?? this.name,
        playerClass: playerClass ?? this.playerClass,
        rarity: rarity ?? this.rarity,
        textContent: textContent ?? this.textContent,
        type: type ?? this.type,
      );
  @override
  String toString() {
    return (StringBuffer('DriftCollectionCardDTOData(')
          ..write('collectionCardId: $collectionCardId, ')
          ..write('collectionModelId: $collectionModelId, ')
          ..write('artist: $artist, ')
          ..write('cardId: $cardId, ')
          ..write('attack: $attack, ')
          ..write('cardSet: $cardSet, ')
          ..write('cost: $cost, ')
          ..write('dbfId: $dbfId, ')
          ..write('collectible: $collectible, ')
          ..write('elite: $elite, ')
          ..write('faction: $faction, ')
          ..write('flavor: $flavor, ')
          ..write('health: $health, ')
          ..write('img: $img, ')
          ..write('imgGold: $imgGold, ')
          ..write('locale: $locale, ')
          ..write('name: $name, ')
          ..write('playerClass: $playerClass, ')
          ..write('rarity: $rarity, ')
          ..write('textContent: $textContent, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        collectionCardId,
        collectionModelId,
        artist,
        cardId,
        attack,
        cardSet,
        cost,
        dbfId,
        collectible,
        elite,
        faction,
        flavor,
        health,
        img,
        imgGold,
        locale,
        name,
        playerClass,
        rarity,
        textContent,
        type
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DriftCollectionCardDTOData &&
          other.collectionCardId == this.collectionCardId &&
          other.collectionModelId == this.collectionModelId &&
          other.artist == this.artist &&
          other.cardId == this.cardId &&
          other.attack == this.attack &&
          other.cardSet == this.cardSet &&
          other.cost == this.cost &&
          other.dbfId == this.dbfId &&
          other.collectible == this.collectible &&
          other.elite == this.elite &&
          other.faction == this.faction &&
          other.flavor == this.flavor &&
          other.health == this.health &&
          other.img == this.img &&
          other.imgGold == this.imgGold &&
          other.locale == this.locale &&
          other.name == this.name &&
          other.playerClass == this.playerClass &&
          other.rarity == this.rarity &&
          other.textContent == this.textContent &&
          other.type == this.type);
}

class DriftCollectionCardDTOCompanion
    extends UpdateCompanion<DriftCollectionCardDTOData> {
  final Value<int?> collectionCardId;
  final Value<int?> collectionModelId;
  final Value<String?> artist;
  final Value<String?> cardId;
  final Value<int?> attack;
  final Value<String?> cardSet;
  final Value<int?> cost;
  final Value<String?> dbfId;
  final Value<bool?> collectible;
  final Value<bool?> elite;
  final Value<String?> faction;
  final Value<String?> flavor;
  final Value<int?> health;
  final Value<String?> img;
  final Value<String?> imgGold;
  final Value<String?> locale;
  final Value<String?> name;
  final Value<String?> playerClass;
  final Value<String?> rarity;
  final Value<String?> textContent;
  final Value<String?> type;
  const DriftCollectionCardDTOCompanion({
    this.collectionCardId = const Value.absent(),
    this.collectionModelId = const Value.absent(),
    this.artist = const Value.absent(),
    this.cardId = const Value.absent(),
    this.attack = const Value.absent(),
    this.cardSet = const Value.absent(),
    this.cost = const Value.absent(),
    this.dbfId = const Value.absent(),
    this.collectible = const Value.absent(),
    this.elite = const Value.absent(),
    this.faction = const Value.absent(),
    this.flavor = const Value.absent(),
    this.health = const Value.absent(),
    this.img = const Value.absent(),
    this.imgGold = const Value.absent(),
    this.locale = const Value.absent(),
    this.name = const Value.absent(),
    this.playerClass = const Value.absent(),
    this.rarity = const Value.absent(),
    this.textContent = const Value.absent(),
    this.type = const Value.absent(),
  });
  DriftCollectionCardDTOCompanion.insert({
    this.collectionCardId = const Value.absent(),
    this.collectionModelId = const Value.absent(),
    this.artist = const Value.absent(),
    this.cardId = const Value.absent(),
    this.attack = const Value.absent(),
    this.cardSet = const Value.absent(),
    this.cost = const Value.absent(),
    this.dbfId = const Value.absent(),
    this.collectible = const Value.absent(),
    this.elite = const Value.absent(),
    this.faction = const Value.absent(),
    this.flavor = const Value.absent(),
    this.health = const Value.absent(),
    this.img = const Value.absent(),
    this.imgGold = const Value.absent(),
    this.locale = const Value.absent(),
    this.name = const Value.absent(),
    this.playerClass = const Value.absent(),
    this.rarity = const Value.absent(),
    this.textContent = const Value.absent(),
    this.type = const Value.absent(),
  });
  static Insertable<DriftCollectionCardDTOData> custom({
    Expression<int?>? collectionCardId,
    Expression<int?>? collectionModelId,
    Expression<String?>? artist,
    Expression<String?>? cardId,
    Expression<int?>? attack,
    Expression<String?>? cardSet,
    Expression<int?>? cost,
    Expression<String?>? dbfId,
    Expression<bool?>? collectible,
    Expression<bool?>? elite,
    Expression<String?>? faction,
    Expression<String?>? flavor,
    Expression<int?>? health,
    Expression<String?>? img,
    Expression<String?>? imgGold,
    Expression<String?>? locale,
    Expression<String?>? name,
    Expression<String?>? playerClass,
    Expression<String?>? rarity,
    Expression<String?>? textContent,
    Expression<String?>? type,
  }) {
    return RawValuesInsertable({
      if (collectionCardId != null) 'collection_card_id': collectionCardId,
      if (collectionModelId != null) 'collection_model_id': collectionModelId,
      if (artist != null) 'artist': artist,
      if (cardId != null) 'card_id': cardId,
      if (attack != null) 'attack': attack,
      if (cardSet != null) 'card_set': cardSet,
      if (cost != null) 'cost': cost,
      if (dbfId != null) 'dbf_id': dbfId,
      if (collectible != null) 'collectible': collectible,
      if (elite != null) 'elite': elite,
      if (faction != null) 'faction': faction,
      if (flavor != null) 'flavor': flavor,
      if (health != null) 'health': health,
      if (img != null) 'img': img,
      if (imgGold != null) 'img_gold': imgGold,
      if (locale != null) 'locale': locale,
      if (name != null) 'name': name,
      if (playerClass != null) 'player_class': playerClass,
      if (rarity != null) 'rarity': rarity,
      if (textContent != null) 'text': textContent,
      if (type != null) 'type': type,
    });
  }

  DriftCollectionCardDTOCompanion copyWith(
      {Value<int?>? collectionCardId,
      Value<int?>? collectionModelId,
      Value<String?>? artist,
      Value<String?>? cardId,
      Value<int?>? attack,
      Value<String?>? cardSet,
      Value<int?>? cost,
      Value<String?>? dbfId,
      Value<bool?>? collectible,
      Value<bool?>? elite,
      Value<String?>? faction,
      Value<String?>? flavor,
      Value<int?>? health,
      Value<String?>? img,
      Value<String?>? imgGold,
      Value<String?>? locale,
      Value<String?>? name,
      Value<String?>? playerClass,
      Value<String?>? rarity,
      Value<String?>? textContent,
      Value<String?>? type}) {
    return DriftCollectionCardDTOCompanion(
      collectionCardId: collectionCardId ?? this.collectionCardId,
      collectionModelId: collectionModelId ?? this.collectionModelId,
      artist: artist ?? this.artist,
      cardId: cardId ?? this.cardId,
      attack: attack ?? this.attack,
      cardSet: cardSet ?? this.cardSet,
      cost: cost ?? this.cost,
      dbfId: dbfId ?? this.dbfId,
      collectible: collectible ?? this.collectible,
      elite: elite ?? this.elite,
      faction: faction ?? this.faction,
      flavor: flavor ?? this.flavor,
      health: health ?? this.health,
      img: img ?? this.img,
      imgGold: imgGold ?? this.imgGold,
      locale: locale ?? this.locale,
      name: name ?? this.name,
      playerClass: playerClass ?? this.playerClass,
      rarity: rarity ?? this.rarity,
      textContent: textContent ?? this.textContent,
      type: type ?? this.type,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (collectionCardId.present) {
      map['collection_card_id'] = Variable<int?>(collectionCardId.value);
    }
    if (collectionModelId.present) {
      map['collection_model_id'] = Variable<int?>(collectionModelId.value);
    }
    if (artist.present) {
      map['artist'] = Variable<String?>(artist.value);
    }
    if (cardId.present) {
      map['card_id'] = Variable<String?>(cardId.value);
    }
    if (attack.present) {
      map['attack'] = Variable<int?>(attack.value);
    }
    if (cardSet.present) {
      map['card_set'] = Variable<String?>(cardSet.value);
    }
    if (cost.present) {
      map['cost'] = Variable<int?>(cost.value);
    }
    if (dbfId.present) {
      map['dbf_id'] = Variable<String?>(dbfId.value);
    }
    if (collectible.present) {
      map['collectible'] = Variable<bool?>(collectible.value);
    }
    if (elite.present) {
      map['elite'] = Variable<bool?>(elite.value);
    }
    if (faction.present) {
      map['faction'] = Variable<String?>(faction.value);
    }
    if (flavor.present) {
      map['flavor'] = Variable<String?>(flavor.value);
    }
    if (health.present) {
      map['health'] = Variable<int?>(health.value);
    }
    if (img.present) {
      map['img'] = Variable<String?>(img.value);
    }
    if (imgGold.present) {
      map['img_gold'] = Variable<String?>(imgGold.value);
    }
    if (locale.present) {
      map['locale'] = Variable<String?>(locale.value);
    }
    if (name.present) {
      map['name'] = Variable<String?>(name.value);
    }
    if (playerClass.present) {
      map['player_class'] = Variable<String?>(playerClass.value);
    }
    if (rarity.present) {
      map['rarity'] = Variable<String?>(rarity.value);
    }
    if (textContent.present) {
      map['text'] = Variable<String?>(textContent.value);
    }
    if (type.present) {
      map['type'] = Variable<String?>(type.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DriftCollectionCardDTOCompanion(')
          ..write('collectionCardId: $collectionCardId, ')
          ..write('collectionModelId: $collectionModelId, ')
          ..write('artist: $artist, ')
          ..write('cardId: $cardId, ')
          ..write('attack: $attack, ')
          ..write('cardSet: $cardSet, ')
          ..write('cost: $cost, ')
          ..write('dbfId: $dbfId, ')
          ..write('collectible: $collectible, ')
          ..write('elite: $elite, ')
          ..write('faction: $faction, ')
          ..write('flavor: $flavor, ')
          ..write('health: $health, ')
          ..write('img: $img, ')
          ..write('imgGold: $imgGold, ')
          ..write('locale: $locale, ')
          ..write('name: $name, ')
          ..write('playerClass: $playerClass, ')
          ..write('rarity: $rarity, ')
          ..write('textContent: $textContent, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }
}

class $DriftCollectionCardDTOTable extends DriftCollectionCardDTO
    with TableInfo<$DriftCollectionCardDTOTable, DriftCollectionCardDTOData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DriftCollectionCardDTOTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _collectionCardIdMeta =
      const VerificationMeta('collectionCardId');
  @override
  late final GeneratedColumn<int?> collectionCardId = GeneratedColumn<int?>(
      'collection_card_id', aliasedName, true,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _collectionModelIdMeta =
      const VerificationMeta('collectionModelId');
  @override
  late final GeneratedColumn<int?> collectionModelId = GeneratedColumn<int?>(
      'collection_model_id', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _artistMeta = const VerificationMeta('artist');
  @override
  late final GeneratedColumn<String?> artist = GeneratedColumn<String?>(
      'artist', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _cardIdMeta = const VerificationMeta('cardId');
  @override
  late final GeneratedColumn<String?> cardId = GeneratedColumn<String?>(
      'card_id', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _attackMeta = const VerificationMeta('attack');
  @override
  late final GeneratedColumn<int?> attack = GeneratedColumn<int?>(
      'attack', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _cardSetMeta = const VerificationMeta('cardSet');
  @override
  late final GeneratedColumn<String?> cardSet = GeneratedColumn<String?>(
      'card_set', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _costMeta = const VerificationMeta('cost');
  @override
  late final GeneratedColumn<int?> cost = GeneratedColumn<int?>(
      'cost', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _dbfIdMeta = const VerificationMeta('dbfId');
  @override
  late final GeneratedColumn<String?> dbfId = GeneratedColumn<String?>(
      'dbf_id', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _collectibleMeta =
      const VerificationMeta('collectible');
  @override
  late final GeneratedColumn<bool?> collectible = GeneratedColumn<bool?>(
      'collectible', aliasedName, true,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (collectible IN (0, 1))');
  final VerificationMeta _eliteMeta = const VerificationMeta('elite');
  @override
  late final GeneratedColumn<bool?> elite = GeneratedColumn<bool?>(
      'elite', aliasedName, true,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (elite IN (0, 1))');
  final VerificationMeta _factionMeta = const VerificationMeta('faction');
  @override
  late final GeneratedColumn<String?> faction = GeneratedColumn<String?>(
      'faction', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _flavorMeta = const VerificationMeta('flavor');
  @override
  late final GeneratedColumn<String?> flavor = GeneratedColumn<String?>(
      'flavor', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _healthMeta = const VerificationMeta('health');
  @override
  late final GeneratedColumn<int?> health = GeneratedColumn<int?>(
      'health', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _imgMeta = const VerificationMeta('img');
  @override
  late final GeneratedColumn<String?> img = GeneratedColumn<String?>(
      'img', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _imgGoldMeta = const VerificationMeta('imgGold');
  @override
  late final GeneratedColumn<String?> imgGold = GeneratedColumn<String?>(
      'img_gold', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _localeMeta = const VerificationMeta('locale');
  @override
  late final GeneratedColumn<String?> locale = GeneratedColumn<String?>(
      'locale', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _playerClassMeta =
      const VerificationMeta('playerClass');
  @override
  late final GeneratedColumn<String?> playerClass = GeneratedColumn<String?>(
      'player_class', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _rarityMeta = const VerificationMeta('rarity');
  @override
  late final GeneratedColumn<String?> rarity = GeneratedColumn<String?>(
      'rarity', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _textContentMeta =
      const VerificationMeta('textContent');
  @override
  late final GeneratedColumn<String?> textContent = GeneratedColumn<String?>(
      'text', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String?> type = GeneratedColumn<String?>(
      'type', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        collectionCardId,
        collectionModelId,
        artist,
        cardId,
        attack,
        cardSet,
        cost,
        dbfId,
        collectible,
        elite,
        faction,
        flavor,
        health,
        img,
        imgGold,
        locale,
        name,
        playerClass,
        rarity,
        textContent,
        type
      ];
  @override
  String get aliasedName => _alias ?? 'drift_collection_card_d_t_o';
  @override
  String get actualTableName => 'drift_collection_card_d_t_o';
  @override
  VerificationContext validateIntegrity(
      Insertable<DriftCollectionCardDTOData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('collection_card_id')) {
      context.handle(
          _collectionCardIdMeta,
          collectionCardId.isAcceptableOrUnknown(
              data['collection_card_id']!, _collectionCardIdMeta));
    }
    if (data.containsKey('collection_model_id')) {
      context.handle(
          _collectionModelIdMeta,
          collectionModelId.isAcceptableOrUnknown(
              data['collection_model_id']!, _collectionModelIdMeta));
    }
    if (data.containsKey('artist')) {
      context.handle(_artistMeta,
          artist.isAcceptableOrUnknown(data['artist']!, _artistMeta));
    }
    if (data.containsKey('card_id')) {
      context.handle(_cardIdMeta,
          cardId.isAcceptableOrUnknown(data['card_id']!, _cardIdMeta));
    }
    if (data.containsKey('attack')) {
      context.handle(_attackMeta,
          attack.isAcceptableOrUnknown(data['attack']!, _attackMeta));
    }
    if (data.containsKey('card_set')) {
      context.handle(_cardSetMeta,
          cardSet.isAcceptableOrUnknown(data['card_set']!, _cardSetMeta));
    }
    if (data.containsKey('cost')) {
      context.handle(
          _costMeta, cost.isAcceptableOrUnknown(data['cost']!, _costMeta));
    }
    if (data.containsKey('dbf_id')) {
      context.handle(
          _dbfIdMeta, dbfId.isAcceptableOrUnknown(data['dbf_id']!, _dbfIdMeta));
    }
    if (data.containsKey('collectible')) {
      context.handle(
          _collectibleMeta,
          collectible.isAcceptableOrUnknown(
              data['collectible']!, _collectibleMeta));
    }
    if (data.containsKey('elite')) {
      context.handle(
          _eliteMeta, elite.isAcceptableOrUnknown(data['elite']!, _eliteMeta));
    }
    if (data.containsKey('faction')) {
      context.handle(_factionMeta,
          faction.isAcceptableOrUnknown(data['faction']!, _factionMeta));
    }
    if (data.containsKey('flavor')) {
      context.handle(_flavorMeta,
          flavor.isAcceptableOrUnknown(data['flavor']!, _flavorMeta));
    }
    if (data.containsKey('health')) {
      context.handle(_healthMeta,
          health.isAcceptableOrUnknown(data['health']!, _healthMeta));
    }
    if (data.containsKey('img')) {
      context.handle(
          _imgMeta, img.isAcceptableOrUnknown(data['img']!, _imgMeta));
    }
    if (data.containsKey('img_gold')) {
      context.handle(_imgGoldMeta,
          imgGold.isAcceptableOrUnknown(data['img_gold']!, _imgGoldMeta));
    }
    if (data.containsKey('locale')) {
      context.handle(_localeMeta,
          locale.isAcceptableOrUnknown(data['locale']!, _localeMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('player_class')) {
      context.handle(
          _playerClassMeta,
          playerClass.isAcceptableOrUnknown(
              data['player_class']!, _playerClassMeta));
    }
    if (data.containsKey('rarity')) {
      context.handle(_rarityMeta,
          rarity.isAcceptableOrUnknown(data['rarity']!, _rarityMeta));
    }
    if (data.containsKey('text')) {
      context.handle(_textContentMeta,
          textContent.isAcceptableOrUnknown(data['text']!, _textContentMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {collectionCardId};
  @override
  DriftCollectionCardDTOData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    return DriftCollectionCardDTOData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DriftCollectionCardDTOTable createAlias(String alias) {
    return $DriftCollectionCardDTOTable(attachedDatabase, alias);
  }
}

class DriftCollectionModelDTOData extends DataClass
    implements Insertable<DriftCollectionModelDTOData> {
  final int? collectionModelId;
  final String? nameCollection;
  final String? heroType;
  final int? collectionCardsLenght;
  DriftCollectionModelDTOData(
      {this.collectionModelId,
      this.nameCollection,
      this.heroType,
      this.collectionCardsLenght});
  factory DriftCollectionModelDTOData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DriftCollectionModelDTOData(
      collectionModelId: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}collection_model_id']),
      nameCollection: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name_collection']),
      heroType: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}hero_type']),
      collectionCardsLenght: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}collection_cards_lenght']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || collectionModelId != null) {
      map['collection_model_id'] = Variable<int?>(collectionModelId);
    }
    if (!nullToAbsent || nameCollection != null) {
      map['name_collection'] = Variable<String?>(nameCollection);
    }
    if (!nullToAbsent || heroType != null) {
      map['hero_type'] = Variable<String?>(heroType);
    }
    if (!nullToAbsent || collectionCardsLenght != null) {
      map['collection_cards_lenght'] = Variable<int?>(collectionCardsLenght);
    }
    return map;
  }

  DriftCollectionModelDTOCompanion toCompanion(bool nullToAbsent) {
    return DriftCollectionModelDTOCompanion(
      collectionModelId: collectionModelId == null && nullToAbsent
          ? const Value.absent()
          : Value(collectionModelId),
      nameCollection: nameCollection == null && nullToAbsent
          ? const Value.absent()
          : Value(nameCollection),
      heroType: heroType == null && nullToAbsent
          ? const Value.absent()
          : Value(heroType),
      collectionCardsLenght: collectionCardsLenght == null && nullToAbsent
          ? const Value.absent()
          : Value(collectionCardsLenght),
    );
  }

  factory DriftCollectionModelDTOData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DriftCollectionModelDTOData(
      collectionModelId: serializer.fromJson<int?>(json['collectionModelId']),
      nameCollection: serializer.fromJson<String?>(json['nameCollection']),
      heroType: serializer.fromJson<String?>(json['heroType']),
      collectionCardsLenght:
          serializer.fromJson<int?>(json['collectionCardsLenght']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'collectionModelId': serializer.toJson<int?>(collectionModelId),
      'nameCollection': serializer.toJson<String?>(nameCollection),
      'heroType': serializer.toJson<String?>(heroType),
      'collectionCardsLenght': serializer.toJson<int?>(collectionCardsLenght),
    };
  }

  DriftCollectionModelDTOData copyWith(
          {int? collectionModelId,
          String? nameCollection,
          String? heroType,
          int? collectionCardsLenght}) =>
      DriftCollectionModelDTOData(
        collectionModelId: collectionModelId ?? this.collectionModelId,
        nameCollection: nameCollection ?? this.nameCollection,
        heroType: heroType ?? this.heroType,
        collectionCardsLenght:
            collectionCardsLenght ?? this.collectionCardsLenght,
      );
  @override
  String toString() {
    return (StringBuffer('DriftCollectionModelDTOData(')
          ..write('collectionModelId: $collectionModelId, ')
          ..write('nameCollection: $nameCollection, ')
          ..write('heroType: $heroType, ')
          ..write('collectionCardsLenght: $collectionCardsLenght')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      collectionModelId, nameCollection, heroType, collectionCardsLenght);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DriftCollectionModelDTOData &&
          other.collectionModelId == this.collectionModelId &&
          other.nameCollection == this.nameCollection &&
          other.heroType == this.heroType &&
          other.collectionCardsLenght == this.collectionCardsLenght);
}

class DriftCollectionModelDTOCompanion
    extends UpdateCompanion<DriftCollectionModelDTOData> {
  final Value<int?> collectionModelId;
  final Value<String?> nameCollection;
  final Value<String?> heroType;
  final Value<int?> collectionCardsLenght;
  const DriftCollectionModelDTOCompanion({
    this.collectionModelId = const Value.absent(),
    this.nameCollection = const Value.absent(),
    this.heroType = const Value.absent(),
    this.collectionCardsLenght = const Value.absent(),
  });
  DriftCollectionModelDTOCompanion.insert({
    this.collectionModelId = const Value.absent(),
    this.nameCollection = const Value.absent(),
    this.heroType = const Value.absent(),
    this.collectionCardsLenght = const Value.absent(),
  });
  static Insertable<DriftCollectionModelDTOData> custom({
    Expression<int?>? collectionModelId,
    Expression<String?>? nameCollection,
    Expression<String?>? heroType,
    Expression<int?>? collectionCardsLenght,
  }) {
    return RawValuesInsertable({
      if (collectionModelId != null) 'collection_model_id': collectionModelId,
      if (nameCollection != null) 'name_collection': nameCollection,
      if (heroType != null) 'hero_type': heroType,
      if (collectionCardsLenght != null)
        'collection_cards_lenght': collectionCardsLenght,
    });
  }

  DriftCollectionModelDTOCompanion copyWith(
      {Value<int?>? collectionModelId,
      Value<String?>? nameCollection,
      Value<String?>? heroType,
      Value<int?>? collectionCardsLenght}) {
    return DriftCollectionModelDTOCompanion(
      collectionModelId: collectionModelId ?? this.collectionModelId,
      nameCollection: nameCollection ?? this.nameCollection,
      heroType: heroType ?? this.heroType,
      collectionCardsLenght:
          collectionCardsLenght ?? this.collectionCardsLenght,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (collectionModelId.present) {
      map['collection_model_id'] = Variable<int?>(collectionModelId.value);
    }
    if (nameCollection.present) {
      map['name_collection'] = Variable<String?>(nameCollection.value);
    }
    if (heroType.present) {
      map['hero_type'] = Variable<String?>(heroType.value);
    }
    if (collectionCardsLenght.present) {
      map['collection_cards_lenght'] =
          Variable<int?>(collectionCardsLenght.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DriftCollectionModelDTOCompanion(')
          ..write('collectionModelId: $collectionModelId, ')
          ..write('nameCollection: $nameCollection, ')
          ..write('heroType: $heroType, ')
          ..write('collectionCardsLenght: $collectionCardsLenght')
          ..write(')'))
        .toString();
  }
}

class $DriftCollectionModelDTOTable extends DriftCollectionModelDTO
    with TableInfo<$DriftCollectionModelDTOTable, DriftCollectionModelDTOData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DriftCollectionModelDTOTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _collectionModelIdMeta =
      const VerificationMeta('collectionModelId');
  @override
  late final GeneratedColumn<int?> collectionModelId = GeneratedColumn<int?>(
      'collection_model_id', aliasedName, true,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameCollectionMeta =
      const VerificationMeta('nameCollection');
  @override
  late final GeneratedColumn<String?> nameCollection = GeneratedColumn<String?>(
      'name_collection', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _heroTypeMeta = const VerificationMeta('heroType');
  @override
  late final GeneratedColumn<String?> heroType = GeneratedColumn<String?>(
      'hero_type', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _collectionCardsLenghtMeta =
      const VerificationMeta('collectionCardsLenght');
  @override
  late final GeneratedColumn<int?> collectionCardsLenght =
      GeneratedColumn<int?>('collection_cards_lenght', aliasedName, true,
          type: const IntType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [collectionModelId, nameCollection, heroType, collectionCardsLenght];
  @override
  String get aliasedName => _alias ?? 'drift_collection_model_d_t_o';
  @override
  String get actualTableName => 'drift_collection_model_d_t_o';
  @override
  VerificationContext validateIntegrity(
      Insertable<DriftCollectionModelDTOData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('collection_model_id')) {
      context.handle(
          _collectionModelIdMeta,
          collectionModelId.isAcceptableOrUnknown(
              data['collection_model_id']!, _collectionModelIdMeta));
    }
    if (data.containsKey('name_collection')) {
      context.handle(
          _nameCollectionMeta,
          nameCollection.isAcceptableOrUnknown(
              data['name_collection']!, _nameCollectionMeta));
    }
    if (data.containsKey('hero_type')) {
      context.handle(_heroTypeMeta,
          heroType.isAcceptableOrUnknown(data['hero_type']!, _heroTypeMeta));
    }
    if (data.containsKey('collection_cards_lenght')) {
      context.handle(
          _collectionCardsLenghtMeta,
          collectionCardsLenght.isAcceptableOrUnknown(
              data['collection_cards_lenght']!, _collectionCardsLenghtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {collectionModelId};
  @override
  DriftCollectionModelDTOData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    return DriftCollectionModelDTOData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DriftCollectionModelDTOTable createAlias(String alias) {
    return $DriftCollectionModelDTOTable(attachedDatabase, alias);
  }
}

abstract class _$DatabaseDriftHelper extends GeneratedDatabase {
  _$DatabaseDriftHelper(QueryExecutor e)
      : super(SqlTypeSystem.defaultInstance, e);
  late final $DriftCollectionCardDTOTable driftCollectionCardDTO =
      $DriftCollectionCardDTOTable(this);
  late final $DriftCollectionModelDTOTable driftCollectionModelDTO =
      $DriftCollectionModelDTOTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [driftCollectionCardDTO, driftCollectionModelDTO];
}
