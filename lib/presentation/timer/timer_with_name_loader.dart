import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sisyphus_timer/data/models/timers/simple_timer/simple_timer.dart';
import 'package:sisyphus_timer/presentation/timer/simple_timer/simple_timer_with_name.dart';

class SimpleTimerWithNameLoader extends StatelessWidget {
  const SimpleTimerWithNameLoader({
    required this.simpleTimer,
    required this.tag,
    super.key,
  });
  final SimpleTimer simpleTimer;
  final String tag;

  @override
  Widget build(BuildContext context) => Builder(
        builder: (context) => SimpleTimerWithName(
          simpleTimer: simpleTimer,
          // completed: dataStore.isTimerCompleted(simpleTimer),
          onCompleted: (completed) {
            context.push('/simple-timer');
          },
          tag: tag,
        ),
      );
}
