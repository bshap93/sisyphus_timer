import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sisyphus_timer/data/models/timers/simple_timer/simple_timer.dart';
import 'package:sisyphus_timer/data/models/timers/sisyphus_timer/sisyphus_timer.dart';
import 'package:sisyphus_timer/presentation/timer/timer_with_name_loader.dart';

class TimersGrid extends StatelessWidget {
  const TimersGrid({super.key, required this.timers});
  final List<SisyphusTimer> timers;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          final crossAxisSpacing = constraints.maxWidth * 0.05;
          final timerWidth = (constraints.maxWidth - crossAxisSpacing) / 2.0;
          const aspectRatio = 0.82;
          final timerHeight = timerWidth / aspectRatio;
          // Use max(x, 0.1) to prevent layout error when keyword is visible in modal page
          final mainAxisSpacing =
              max((constraints.maxHeight - timerHeight * 3) / 2.0, 0.1);
          final timerLength = timers.length;
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: crossAxisSpacing,
              mainAxisSpacing: mainAxisSpacing,
              childAspectRatio: aspectRatio,
            ),
            itemBuilder: (context, index) {
              final timer = timers[index];
              if (timer is SimpleTimer) {
                return SimpleTimerWithNameLoader(
                  simpleTimer: timer,
                );
              }
              throw UnimplementedError('Unknown timer type: $timer');
            },
            itemCount: timerLength,
          );
        },
      );
}
