import 'dart:ui';

import 'package:hive/hive.dart';
import 'package:sisyphus_timer/data/models/timers/sisyphus_timer/sisyphus_timer.dart';
import 'package:uuid/uuid.dart';

part 'simple_timer.g.dart';

@HiveType(typeId: 1)
class SimpleTimer extends SisyphusTimer {
  SimpleTimer({
    required this.duration,
    required this.onTimerEnd,
    required this.iconName,
    required super.timerId,
    required super.timerName,
  });

  factory SimpleTimer.create({
    required String timerName,
    required Duration duration,
    required VoidCallback onTimerEnd,
    required String iconName,
  }) {
    final timerId = const Uuid().v1();
    return SimpleTimer(
      timerId: timerId,
      timerName: timerName,
      duration: duration,
      onTimerEnd: onTimerEnd,
      iconName: iconName,
    );
  }

  @HiveField(3)
  final Duration duration;
  @HiveField(4)
  final VoidCallback onTimerEnd;
  @HiveField(5)
  final String iconName;
}
