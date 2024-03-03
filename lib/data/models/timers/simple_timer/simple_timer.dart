import 'dart:ui';

import 'package:hive/hive.dart';
import 'package:sisyphus_timer/data/models/timers/sisyphus_timer.dart';
import 'package:uuid/uuid.dart';

part 'simple_timer.g.dart';

@HiveType(typeId: 1)
class SimpleTimer extends SisyphusTimer {
  SimpleTimer({
    required this.duration,
    required this.onTimerEnd,
    required this.timerName,
    required this.iconName,
  }) : super(timerId: const Uuid().v1(), timerName: timerName);

  @override
  @HiveField(0)
  final String timerName;
  @HiveField(1)
  final Duration duration;
  @HiveField(2)
  final VoidCallback onTimerEnd;
  @HiveField(3)
  final String iconName;
}
