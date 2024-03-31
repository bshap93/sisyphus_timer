import 'package:flutter/material.dart';
import 'package:sisyphus_timer/constants/text_styles.dart';
import 'package:sisyphus_timer/data/models/timers/simple_timer/simple_timer.dart';
import 'package:sisyphus_timer/presentation/home/animated_circle_option/animated_option.dart';
import 'package:sisyphus_timer/presentation/theming/app_theme.dart';

class OptionWithName extends StatelessWidget {
  const OptionWithName({
    required this.simpleTimer,
    required this.tag,
    super.key,
    this.completed,
    this.onCompleted,
  });
  final SimpleTimer simpleTimer;
  final bool? completed;
  final ValueChanged<bool>? onCompleted;
  final String tag;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: AnimatedOption(
              iconName: simpleTimer.iconName,
              completed: completed,
              onCompleted: onCompleted,
              tag: tag,
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
