import 'package:flutter/material.dart';
import 'package:sisyphus_timer/presentation/home/animated_circle_option/option_completion_ring.dart';
import 'package:sisyphus_timer/presentation/theming/app_theme.dart';
import 'package:sisyphus_timer/presentation/widgets/centered_svg_icon.dart';

class TimerRingWithImage extends StatelessWidget {
  const TimerRingWithImage({super.key, required this.iconName});
  final String iconName;

  @override
  Widget build(BuildContext context) {
    final themeData = AppTheme.of(context);
    return Stack(
      children: [
        const OptionCompletionRing(progress: 0),
        Positioned.fill(
          child: CenteredSvgIcon(
            iconName: iconName,
            color: themeData.taskIcon,
          ),
        ),
      ],
    );
  }
}
