// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CardDTOAdapter extends TypeAdapter<CardDTO> {
  @override
  final int typeId = 2;

  @override
  CardDTO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CardDTO(
      cardId: fields[0] as String?,
      dbfId: fields[1] as String?,
      name: fields[2] as String?,
      cardSet: fields[3] as String?,
      type: fields[4] as String?,
      faction: fields[5] as String?,
      rarity: fields[6] as String?,
      cost: fields[7] as int?,
      attack: fields[8] as int?,
      health: fields[9] as int?,
      text: fields[10] as String?,
      flavor: fields[11] as String?,
      artist: fields[12] as String?,
      collectible: fields[13] as bool?,
      elite: fields[14] as bool?,
      playerClass: fields[15] as String?,
      img: fields[16] as String?,
      imgGold: fields[17] as String?,
      locale: fields[18] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CardDTO obj) {
    writer
      ..writeByte(19)
      ..writeByte(0)
      ..write(obj.cardId)
      ..writeByte(1)
      ..write(obj.dbfId)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.cardSet)
      ..writeByte(4)
      ..write(obj.type)
      ..writeByte(5)
      ..write(obj.faction)
      ..writeByte(6)
      ..write(obj.rarity)
      ..writeByte(7)
      ..write(obj.cost)
      ..writeByte(8)
      ..write(obj.attack)
      ..writeByte(9)
      ..write(obj.health)
      ..writeByte(10)
      ..write(obj.text)
      ..writeByte(11)
      ..write(obj.flavor)
      ..writeByte(12)
      ..write(obj.artist)
      ..writeByte(13)
      ..write(obj.collectible)
      ..writeByte(14)
      ..write(obj.elite)
      ..writeByte(15)
      ..write(obj.playerClass)
      ..writeByte(16)
      ..write(obj.img)
      ..writeByte(17)
      ..write(obj.imgGold)
      ..writeByte(18)
      ..write(obj.locale);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CardDTOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
