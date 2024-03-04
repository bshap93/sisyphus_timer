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
      duration: fields[3] as Duration,
      iconName: fields[5] as String,
      timerId: fields[0] as String,
      timerName: fields[1] as String,
      onTimerEnd: fields[4] as void Function()?,
    );
  }

  @override
  void write(BinaryWriter writer, SimpleTimer obj) {
    writer
      ..writeByte(5)
      ..writeByte(3)
      ..write(obj.duration)
      ..writeByte(4)
      ..write(obj.onTimerEnd)
      ..writeByte(5)
      ..write(obj.iconName)
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
      other is SimpleTimerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
