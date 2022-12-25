// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ModalAdapter extends TypeAdapter<Modal> {
  @override
  final int typeId = 0;

  @override
  Modal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Modal()
      ..name = fields[0] as String
      ..email = fields[1] as String
      ..mobileNo = fields[2] as String;
  }

  @override
  void write(BinaryWriter writer, Modal obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.mobileNo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
