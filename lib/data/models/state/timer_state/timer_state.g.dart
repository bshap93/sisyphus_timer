// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_state.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimerStateAdapter extends TypeAdapter<TimerState> {
  @override
  final int typeId = 0;

  @override
  TimerState read(BinaryReader reader) {
    return TimerState();
  }

  @override
  void write(BinaryWriter writer, TimerState obj) {
    writer.writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimerStateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
