
import 'package:sisyphus_timer/constants/app_assets.dart';

class TimerPreset {
  const TimerPreset({required this.name, required this.iconName});
  final String name;
  final String iconName;

  @override
  String toString() => 'TaskPreset($name, $iconName)';

  static  List<TimerPreset> allPresets = [
    // TimerPreset(name: 'Eat a Healthy Meal', iconName: AppAssets.carrot),
    // TimerPreset(name: 'Walk the Dog', iconName: AppAssets.dog),
    // TimerPreset(name: 'Do Some Coding', iconName: AppAssets.html),
    // TimerPreset(name: 'Meditate', iconName: AppAssets.meditation),
    // TimerPreset(name: 'Do 10 Pushups', iconName: AppAssets.pushups),
    // TimerPreset(name: 'Sleep 8 Hours', iconName: AppAssets.rest),
    // TimerPreset(name: 'Take Vitamins', iconName: AppAssets.vitamins),
    // TimerPreset(name: 'Cycle to Work', iconName: AppAssets.bike),
    // TimerPreset(name: 'Wash Your Hands', iconName: AppAssets.washHands),
    // TimerPreset(name: 'Wear a Mask', iconName: AppAssets.mask),
    // TimerPreset(name: 'Brush Your Teeth', iconName: AppAssets.toothbrush),
    // TimerPreset(name: 'Floss Your Teeth', iconName: AppAssets.dentalFloss),
    // TimerPreset(name: 'Drink Water', iconName: AppAssets.water),
    // TimerPreset(name: 'Practice Instrument', iconName: AppAssets.guitar),
    // TimerPreset(name: 'Read for 10 Minutes', iconName: AppAssets.book),
    // TimerPreset(name: 'Don\'t Smoke', iconName: AppAssets.smoking),
    // TimerPreset(name: 'Don\'t Drink Alcohol', iconName: AppAssets.beer),
    // TimerPreset(name: 'Decrease Screen Time', iconName: AppAssets.phone),
    // TimerPreset(name: 'Do a Workout', iconName: AppAssets.dumbell),
    // TimerPreset(name: 'Do Karate', iconName: AppAssets.karate),
    // TimerPreset(name: 'Go Running', iconName: AppAssets.run),
    // TimerPreset(name: 'Go Swimming', iconName: AppAssets.swimmer),
    // TimerPreset(name: 'Do Some Stretches', iconName: AppAssets.stretching),
    // TimerPreset(name: 'Play Sports', iconName: AppAssets.basketball),
    // TimerPreset(name: 'Spend Time Outside', iconName: AppAssets.sun),
  ];
}
