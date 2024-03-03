// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sisyphus_timer.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SisyphusTimerAdapter extends TypeAdapter<SisyphusTimer> {
  @override
  final int typeId = 3;

  @override
  SisyphusTimer read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SisyphusTimer(
      timerId: fields[0] as String,
      timerName: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SisyphusTimer obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.timerId)
      ..writeByte(1)
      ..write(obj.timerName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SisyphusTimerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
