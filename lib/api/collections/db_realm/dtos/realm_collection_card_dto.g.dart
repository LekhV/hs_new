// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realm_collection_card_dto.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class RealmCollectionCardDTO extends $RealmCollectionCardDTO
    with RealmEntity, RealmObject {
  RealmCollectionCardDTO(
    String collectionCardId,
    String collectionId, {
    String? cardId,
    String? dbfId,
    String? name,
    String? cardSet,
    String? type,
    String? faction,
    String? rarity,
    int? cost,
    int? attack,
    int? health,
    String? text,
    String? flavor,
    String? artist,
    bool? collectible,
    bool? elite,
    String? playerClass,
    String? img,
    String? imgGold,
    String? locale,
  }) {
    RealmObject.set(this, 'collectionCardId', collectionCardId);
    RealmObject.set(this, 'collectionId', collectionId);
    RealmObject.set(this, 'cardId', cardId);
    RealmObject.set(this, 'dbfId', dbfId);
    RealmObject.set(this, 'name', name);
    RealmObject.set(this, 'cardSet', cardSet);
    RealmObject.set(this, 'type', type);
    RealmObject.set(this, 'faction', faction);
    RealmObject.set(this, 'rarity', rarity);
    RealmObject.set(this, 'cost', cost);
    RealmObject.set(this, 'attack', attack);
    RealmObject.set(this, 'health', health);
    RealmObject.set(this, 'text', text);
    RealmObject.set(this, 'flavor', flavor);
    RealmObject.set(this, 'artist', artist);
    RealmObject.set(this, 'collectible', collectible);
    RealmObject.set(this, 'elite', elite);
    RealmObject.set(this, 'playerClass', playerClass);
    RealmObject.set(this, 'img', img);
    RealmObject.set(this, 'imgGold', imgGold);
    RealmObject.set(this, 'locale', locale);
  }

  RealmCollectionCardDTO._();

  @override
  String get collectionCardId =>
      RealmObject.get<String>(this, 'collectionCardId') as String;
  @override
  set collectionCardId(String value) => throw RealmUnsupportedSetError();

  @override
  String get collectionId =>
      RealmObject.get<String>(this, 'collectionId') as String;
  @override
  set collectionId(String value) => throw RealmUnsupportedSetError();

  @override
  String? get cardId => RealmObject.get<String>(this, 'cardId') as String?;
  @override
  set cardId(String? value) => RealmObject.set(this, 'cardId', value);

  @override
  String? get dbfId => RealmObject.get<String>(this, 'dbfId') as String?;
  @override
  set dbfId(String? value) => RealmObject.set(this, 'dbfId', value);

  @override
  String? get name => RealmObject.get<String>(this, 'name') as String?;
  @override
  set name(String? value) => RealmObject.set(this, 'name', value);

  @override
  String? get cardSet => RealmObject.get<String>(this, 'cardSet') as String?;
  @override
  set cardSet(String? value) => RealmObject.set(this, 'cardSet', value);

  @override
  String? get type => RealmObject.get<String>(this, 'type') as String?;
  @override
  set type(String? value) => RealmObject.set(this, 'type', value);

  @override
  String? get faction => RealmObject.get<String>(this, 'faction') as String?;
  @override
  set faction(String? value) => RealmObject.set(this, 'faction', value);

  @override
  String? get rarity => RealmObject.get<String>(this, 'rarity') as String?;
  @override
  set rarity(String? value) => RealmObject.set(this, 'rarity', value);

  @override
  int? get cost => RealmObject.get<int>(this, 'cost') as int?;
  @override
  set cost(int? value) => RealmObject.set(this, 'cost', value);

  @override
  int? get attack => RealmObject.get<int>(this, 'attack') as int?;
  @override
  set attack(int? value) => RealmObject.set(this, 'attack', value);

  @override
  int? get health => RealmObject.get<int>(this, 'health') as int?;
  @override
  set health(int? value) => RealmObject.set(this, 'health', value);

  @override
  String? get text => RealmObject.get<String>(this, 'text') as String?;
  @override
  set text(String? value) => RealmObject.set(this, 'text', value);

  @override
  String? get flavor => RealmObject.get<String>(this, 'flavor') as String?;
  @override
  set flavor(String? value) => RealmObject.set(this, 'flavor', value);

  @override
  String? get artist => RealmObject.get<String>(this, 'artist') as String?;
  @override
  set artist(String? value) => RealmObject.set(this, 'artist', value);

  @override
  bool? get collectible => RealmObject.get<bool>(this, 'collectible') as bool?;
  @override
  set collectible(bool? value) => RealmObject.set(this, 'collectible', value);

  @override
  bool? get elite => RealmObject.get<bool>(this, 'elite') as bool?;
  @override
  set elite(bool? value) => RealmObject.set(this, 'elite', value);

  @override
  String? get playerClass =>
      RealmObject.get<String>(this, 'playerClass') as String?;
  @override
  set playerClass(String? value) => RealmObject.set(this, 'playerClass', value);

  @override
  String? get img => RealmObject.get<String>(this, 'img') as String?;
  @override
  set img(String? value) => RealmObject.set(this, 'img', value);

  @override
  String? get imgGold => RealmObject.get<String>(this, 'imgGold') as String?;
  @override
  set imgGold(String? value) => RealmObject.set(this, 'imgGold', value);

  @override
  String? get locale => RealmObject.get<String>(this, 'locale') as String?;
  @override
  set locale(String? value) => RealmObject.set(this, 'locale', value);

  @override
  Stream<RealmObjectChanges<RealmCollectionCardDTO>> get changes =>
      RealmObject.getChanges<RealmCollectionCardDTO>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObject.registerFactory(RealmCollectionCardDTO._);
    return const SchemaObject(
        RealmCollectionCardDTO, 'RealmCollectionCardDTO', [
      SchemaProperty('collectionCardId', RealmPropertyType.string),
      SchemaProperty('collectionId', RealmPropertyType.string),
      SchemaProperty('cardId', RealmPropertyType.string, optional: true),
      SchemaProperty('dbfId', RealmPropertyType.string, optional: true),
      SchemaProperty('name', RealmPropertyType.string, optional: true),
      SchemaProperty('cardSet', RealmPropertyType.string, optional: true),
      SchemaProperty('type', RealmPropertyType.string, optional: true),
      SchemaProperty('faction', RealmPropertyType.string, optional: true),
      SchemaProperty('rarity', RealmPropertyType.string, optional: true),
      SchemaProperty('cost', RealmPropertyType.int, optional: true),
      SchemaProperty('attack', RealmPropertyType.int, optional: true),
      SchemaProperty('health', RealmPropertyType.int, optional: true),
      SchemaProperty('text', RealmPropertyType.string, optional: true),
      SchemaProperty('flavor', RealmPropertyType.string, optional: true),
      SchemaProperty('artist', RealmPropertyType.string, optional: true),
      SchemaProperty('collectible', RealmPropertyType.bool, optional: true),
      SchemaProperty('elite', RealmPropertyType.bool, optional: true),
      SchemaProperty('playerClass', RealmPropertyType.string, optional: true),
      SchemaProperty('img', RealmPropertyType.string, optional: true),
      SchemaProperty('imgGold', RealmPropertyType.string, optional: true),
      SchemaProperty('locale', RealmPropertyType.string, optional: true),
    ]);
  }
}
