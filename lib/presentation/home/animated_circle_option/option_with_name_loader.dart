import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sisyphus_timer/data/models/timers/simple_timer/simple_timer.dart';
import 'package:sisyphus_timer/presentation/home/animated_circle_option/simple_timer/option_with_name.dart';

class OptionWithNameLoader extends StatelessWidget {
  const OptionWithNameLoader({
    required this.simpleTimer,
    required this.tag,
    super.key,
  });
  final SimpleTimer simpleTimer;
  final String tag;

  @override
  Widget build(BuildContext context) => Builder(
        builder: (context) => OptionWithName(
          simpleTimer: simpleTimer,
          // completed: dataStore.isTimerCompleted(simpleTimer),
          onCompleted: (completed) {
            context.push('/simple-timer');
          },
          tag: tag,
        ),
      );
}
