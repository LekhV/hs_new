// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realm_collection_model_dto.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class RealmCollectionModelDTO extends $RealmCollectionModelDTO
    with RealmEntity, RealmObject {
  RealmCollectionModelDTO(
    String nameCollection, {
    String? heroType,
    Iterable<RealmCollectionCardDTO> collectionCards = const [],
  }) {
    RealmObject.set(this, 'nameCollection', nameCollection);
    RealmObject.set(this, 'heroType', heroType);
    RealmObject.set<RealmList<RealmCollectionCardDTO>>(this, 'collectionCards',
        RealmList<RealmCollectionCardDTO>(collectionCards));
  }

  RealmCollectionModelDTO._();

  @override
  String get nameCollection =>
      RealmObject.get<String>(this, 'nameCollection') as String;
  @override
  set nameCollection(String value) => throw RealmUnsupportedSetError();

  @override
  String? get heroType => RealmObject.get<String>(this, 'heroType') as String?;
  @override
  set heroType(String? value) => RealmObject.set(this, 'heroType', value);

  @override
  RealmList<RealmCollectionCardDTO> get collectionCards =>
      RealmObject.get<RealmCollectionCardDTO>(this, 'collectionCards')
          as RealmList<RealmCollectionCardDTO>;
  @override
  set collectionCards(covariant RealmList<RealmCollectionCardDTO> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<RealmCollectionModelDTO>> get changes =>
      RealmObject.getChanges<RealmCollectionModelDTO>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObject.registerFactory(RealmCollectionModelDTO._);
    return const SchemaObject(
        RealmCollectionModelDTO, 'RealmCollectionModelDTO', [
      SchemaProperty('nameCollection', RealmPropertyType.string,
          primaryKey: true),
      SchemaProperty('heroType', RealmPropertyType.string, optional: true),
      SchemaProperty('collectionCards', RealmPropertyType.object,
          linkTarget: 'RealmCollectionCardDTO',
          collectionType: RealmCollectionType.list),
    ]);
  }
}
