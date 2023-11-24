// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RepoEntityAdapter extends TypeAdapter<RepoEntity> {
  @override
  final int typeId = 1;

  @override
  RepoEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RepoEntity(
      id: fields[0] as int,
      name: fields[1] as String,
      description: fields[2] as String,
      issues: fields[3] as int,
      watchers: fields[4] as int,
      language: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, RepoEntity obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.issues)
      ..writeByte(4)
      ..write(obj.watchers)
      ..writeByte(5)
      ..write(obj.language);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RepoEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
