// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realm_collection_card_dto.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class RealmCollectionCardDTO extends $RealmCollectionCardDTO
    with RealmEntity, RealmObject {
  RealmCollectionCardDTO(
    String collectionCardId, {
    RealmCardDTO? card,
  }) {
    RealmObject.set(this, 'collectionCardId', collectionCardId);
    RealmObject.set(this, 'card', card);
  }

  RealmCollectionCardDTO._();

  @override
  String get collectionCardId =>
      RealmObject.get<String>(this, 'collectionCardId') as String;
  @override
  set collectionCardId(String value) => throw RealmUnsupportedSetError();

  @override
  RealmCardDTO? get card =>
      RealmObject.get<RealmCardDTO>(this, 'card') as RealmCardDTO?;
  @override
  set card(covariant RealmCardDTO? value) =>
      RealmObject.set(this, 'card', value);

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
      SchemaProperty('card', RealmPropertyType.object,
          optional: true, linkTarget: 'RealmCardDTO'),
    ]);
  }
}
