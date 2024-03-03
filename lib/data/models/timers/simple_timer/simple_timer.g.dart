// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simple_timer.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SimpleTimerAdapter extends TypeAdapter<SimpleTimer> {
  @override
  final int typeId = 1;

  @override
  SimpleTimer read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SimpleTimer(
      duration: fields[1] as Duration,
      onTimerEnd: fields[2] as void Function(),
      timerName: fields[0] as String,
      iconName: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SimpleTimer obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.timerName)
      ..writeByte(1)
      ..write(obj.duration)
      ..writeByte(2)
      ..write(obj.onTimerEnd)
      ..writeByte(3)
      ..write(obj.iconName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SimpleTimerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
