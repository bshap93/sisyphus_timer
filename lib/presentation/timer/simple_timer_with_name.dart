import 'package:flutter/material.dart';
import 'package:sisyphus_timer/constants/text_styles.dart';
import 'package:sisyphus_timer/data/models/timers/simple_timer/simple_timer.dart';
import 'package:sisyphus_timer/presentation/timer/animated_timer.dart';

import '../theming/app_theme.dart';

class SimpleTimerWithName extends StatelessWidget {
  const SimpleTimerWithName({
    required this.simpleTimer,
    super.key,
    this.completed,
    this.onCompleted,
  });
  final SimpleTimer simpleTimer;
  final bool? completed;
  final ValueChanged<bool>? onCompleted;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: AnimatedSimpleTimer(
              iconName: simpleTimer.iconName,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 39,
            child: Text(
              simpleTimer.timerName.toUpperCase(),
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyles.taskName.copyWith(
                color: AppTheme.of(context).accent,
              ),
            ),
          ),
        ],
      );
}
