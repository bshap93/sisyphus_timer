import 'package:hive/hive.dart';

part 'sisyphus_timer.g.dart';

@HiveType(typeId: 3)
abstract class SisyphusTimer {
  SisyphusTimer({required this.timerId, required this.timerName});
  @HiveField(0)
  final String timerId;
  @HiveField(1)
  final String timerName;
  // All inheriting timers should pick up 1+ after HiveField index
  // last in above fields
}
