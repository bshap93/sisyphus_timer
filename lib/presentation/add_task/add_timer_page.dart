import 'package:flutter/material.dart';
import 'package:sisyphus_timer/constants/app_assets.dart';
import 'package:sisyphus_timer/constants/text_styles.dart';
import 'package:sisyphus_timer/data/models/timer_preset.dart';
import 'package:sisyphus_timer/presentation/add_task/add_task_navigator.dart';
import 'package:sisyphus_timer/presentation/add_task/custom_text_field.dart';
import 'package:sisyphus_timer/presentation/add_task/timer_preset_list_tile.dart';
import 'package:sisyphus_timer/presentation/add_task/text_field_header.dart';

import 'package:sisyphus_timer/presentation/theming/app_theme.dart';
import 'package:sisyphus_timer/presentation/widgets/app_bar_icon_button.dart';

class AddTimerPage extends StatelessWidget {
  const AddTimerPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.of(context).secondary,
        leading: AppBarIconButton(
          iconName: AppAssets.navigationClose,
          // * Using `rootNavigator: true` to ensure we dismiss the entire navigation stack.
          // * Remember that we show this page inside [AddTaskNavigator],
          // * which already contains a [Navigator])
          onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
        ),
        title: Text(
          'Add Task',
          style: TextStyles.heading.copyWith(
            color: AppTheme.of(context).settingsText,
          ),
        ),
        elevation: 0,
      ),
      backgroundColor: AppTheme.of(context).primary,
      body: const AddTaskContents(),
    );
}

class AddTaskContents extends StatelessWidget {
  const AddTaskContents({super.key});

  @override
  Widget build(BuildContext context) => CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              const TextFieldHeader('CREATE YOUR OWN:'),
              CustomTextField(
                hintText: 'Enter task title...',
                showChevron: true,
                onSubmit: (value) => Navigator.of(context).pushNamed(
                  AddTimerRoutes.confirmTask,
                  arguments: TimerPreset(
                      iconName: value.substring(0, 1).toUpperCase(),
                      name: value),
                ),
              ),
              const SizedBox(height: 32),
              const TextFieldHeader('OR CHOOSE A PRESET:'),
            ],
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => TimerPresetListTile(
              taskPreset: TimerPreset.allPresets[index],
              onPressed: (taskPreset) => Navigator.of(context).pushNamed(
                AddTimerRoutes.confirmTask,
                arguments: taskPreset,
              ),
            ),
            childCount: TimerPreset.allPresets.length,
          ),
        ),
        // Account for safe area
        SliverToBoxAdapter(
          child: SizedBox(
            height: MediaQuery.of(context).padding.bottom,
          ),
        )
      ],
    );
}
