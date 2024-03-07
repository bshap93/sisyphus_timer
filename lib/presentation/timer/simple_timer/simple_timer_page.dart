import 'package:flutter/material.dart';
import 'package:sisyphus_timer/presentation/theming/app_theme.dart';
import 'package:sisyphus_timer/presentation/timer/simple_timer/simple_timer_with_name.dart';

import '../../../data/models/timers/simple_timer/simple_timer.dart';

class SimpleTimerPage extends StatelessWidget {
  const SimpleTimerPage({required this.timerId, super.key});

  final String timerId;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppTheme.of(context).primary,
        body: SafeArea(
          child: Center(
              child: SimpleTimerWithName(
            simpleTimer: SimpleTimer.create(
              tag: 'makathar',
              iconName: 'assets/makathar.svg',
              duration: const Duration(minutes: 25),
              timerName: 'Makathar Attack',
            ),
            tag: timerId,
          )),
        ),
      );
}
