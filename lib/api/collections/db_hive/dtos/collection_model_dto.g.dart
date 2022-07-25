// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_model_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CollectionModelDTOAdapter extends TypeAdapter<CollectionModelDTO> {
  @override
  final int typeId = 0;

  @override
  CollectionModelDTO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CollectionModelDTO(
      nameCollection: fields[0] as String,
      heroType: fields[1] as String,
      collectionCards: (fields[2] as List?)?.cast<CollectionCardDTO>(),
    );
  }

  @override
  void write(BinaryWriter writer, CollectionModelDTO obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.nameCollection)
      ..writeByte(1)
      ..write(obj.heroType)
      ..writeByte(2)
      ..write(obj.collectionCards);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CollectionModelDTOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
