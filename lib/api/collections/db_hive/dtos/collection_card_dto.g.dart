// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_card_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CollectionCardDTOAdapter extends TypeAdapter<CollectionCardDTO> {
  @override
  final int typeId = 1;

  @override
  CollectionCardDTO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CollectionCardDTO(
      collectionCardId: fields[0] as String,
      card: fields[1] as CardDTO,
    );
  }

  @override
  void write(BinaryWriter writer, CollectionCardDTO obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.collectionCardId)
      ..writeByte(1)
      ..write(obj.card);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CollectionCardDTOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
