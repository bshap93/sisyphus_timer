import 'dart:ui';

import 'package:hive/hive.dart';
import 'package:sisyphus_timer/data/models/timers/sisyphus_timer/sisyphus_timer.dart';
import 'package:uuid/uuid.dart';

part 'simple_timer.g.dart';

@HiveType(typeId: 1)
class SimpleTimer extends SisyphusTimer {
  SimpleTimer({
    required this.duration,
    required this.iconName,
    required super.timerId,
    required super.timerName,
    required this.tag,
    this.onTimerEnd,
  });

  factory SimpleTimer.create({
    required String timerName,
    required Duration duration,
    required String iconName,
    required String tag,
    VoidCallback? onTimerEnd,
  }) {
    final timerId = const Uuid().v1();
    return SimpleTimer(
      tag: tag,
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
  final VoidCallback? onTimerEnd;
  @HiveField(5)
  final String iconName;
  @HiveField(6)
  final String tag;
}
