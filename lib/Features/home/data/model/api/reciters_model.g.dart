// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reciters_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReciterModelAdapter extends TypeAdapter<ReciterModel> {
  @override
  final int typeId = 0;

  @override
  ReciterModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReciterModel(
      id: fields[0] as int,
      name: fields[1] as String,
      letter: fields[2] as String,
      moshaf: (fields[3] as List).cast<MoshafModel>(),
      image: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ReciterModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.letter)
      ..writeByte(3)
      ..write(obj.moshaf)
      ..writeByte(4)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReciterModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MoshafModelAdapter extends TypeAdapter<MoshafModel> {
  @override
  final int typeId = 1;

  @override
  MoshafModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MoshafModel(
      id: fields[0] as int,
      name: fields[1] as String,
      server: fields[2] as String,
      surahTotal: fields[3] as int,
      moshafType: fields[4] as int,
      surahList: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MoshafModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.server)
      ..writeByte(3)
      ..write(obj.surahTotal)
      ..writeByte(4)
      ..write(obj.moshafType)
      ..writeByte(5)
      ..write(obj.surahList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MoshafModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
