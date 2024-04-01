import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sisyphus_timer/constants/app_colors.dart';
import 'package:sisyphus_timer/constants/text_styles.dart';
import 'package:sisyphus_timer/data/models/timer_preset.dart';
import 'package:sisyphus_timer/presentation/theming/app_theme.dart';
import 'package:sisyphus_timer/presentation/widgets/chevron_icon.dart';
import 'package:sisyphus_timer/presentation/widgets/selectable_tile.dart';


class TimerPresetListTile extends StatelessWidget {
  const TimerPresetListTile({
    super.key,
    required this.taskPreset,
    this.showChevron = true,
    this.onPressed,
  });
  final TimerPreset taskPreset;
  final bool showChevron;
  final ValueChanged<TimerPreset>? onPressed;

  @override
  Widget build(BuildContext context) => SelectableTile(
      onPressed: () => onPressed?.call(taskPreset),
      builder: (context, isSelected) => Container(
        color: isSelected
            ? AppTheme.of(context).secondary.withOpacity(0.5)
            : AppTheme.of(context).secondary,
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: ListTile(
          leading: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppTheme.of(context).settingsListIconBackground,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              taskPreset.iconName,
              colorFilter:
                  const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
              width: 24,
              height: 24,
            ),
          ),
          title: Text(
            taskPreset.name,
            style: TextStyles.content.copyWith(
              color: AppTheme.of(context).settingsText,
            ),
          ),
          trailing: showChevron
              ? ChevronIcon(color: AppTheme.of(context).accent)
              : null,
        ),
      ),
    );
}
