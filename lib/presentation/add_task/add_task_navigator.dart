import 'package:flutter/material.dart';
import 'package:sisyphus_timer/data/models/timer_preset.dart';
import 'package:sisyphus_timer/data/models/timers/sisyphus_timer/sisyphus_timer.dart';
import 'package:sisyphus_timer/presentation/add_task/add_timer_page.dart';
import 'package:sisyphus_timer/presentation/add_task/task_details_page.dart';
// * The "add task" flow is composed by these two pages
class AddTimerRoutes {
  static const root = '/';
  static const confirmTask = '/confirmTask';
}

class AddTimerNavigator extends StatelessWidget {
  const AddTimerNavigator({super.key,});

  @override
  Widget build(BuildContext context) {
    // * Using a nested navigator to show the `AddTaskPage` and `TaskDetailsPage`
    // * widgets inside the same navigation stack within `showCupertinoModalBottomSheet`
    return Navigator(
      initialRoute: AddTimerRoutes.root,
      onGenerateRoute: (routeSettings) => MaterialPageRoute(
        builder: (context) {
          switch (routeSettings.name) {
            case AddTimerRoutes.root:
              return const AddTimerPage();
            case AddTimerRoutes.confirmTask:
              // * The TaskPreset is passed to the route arguments, so here
              // * we extract it and use it to create a new Task object
              final taskPreset = routeSettings.arguments as TimerPreset;
              final timer = SisyphusTimer.create(
                name: taskPreset.name,
                iconName: taskPreset.iconName,
              );
              return TimerDetailsPage(
                timer: timer,
                isNewTimer: true,

              );
            default:
              throw UnimplementedError();
          }
        },
      ),
    );
  }
}
