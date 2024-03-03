import 'package:flutter/material.dart';
import 'package:sisyphus_timer/data/models/timers/sisyphus_timer.dart';
import 'package:sisyphus_timer/presentation/home/home_page_bottom_options.dart';
import 'package:sisyphus_timer/presentation/home/timers_grid.dart';
import 'package:sisyphus_timer/presentation/theming/app_theme.dart';

class TimersGridPage extends StatelessWidget {
  const TimersGridPage({
    required this.sisyphusTimers,
    super.key,
  });
  final List<SisyphusTimer> sisyphusTimers;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppTheme.of(context).primary,
        body: SafeArea(
          child: TasksGridContents(
            sisyphusTimers: sisyphusTimers,
          ),
        ),
      );
}

class TasksGridContents extends StatelessWidget {
  const TasksGridContents({
    required this.sisyphusTimers,
    super.key,
  });
  final List<SisyphusTimer> sisyphusTimers;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: TimersGrid(
                timers: sisyphusTimers,
              ),
            ),
          ),
          const HomePageBottomOptions(),
        ],
      );
}
