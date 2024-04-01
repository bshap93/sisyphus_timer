import 'package:flutter/material.dart';
import 'package:sisyphus_timer/data/models/timers/simple_timer/simple_timer.dart';
import 'package:sisyphus_timer/presentation/home/timers_grid_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) => TimersGridPage(
        sisyphusTimers: [
          SimpleTimer.create(
            tag: 'makathar',
            iconName: 'assets/makathar.svg',
            duration: const Duration(minutes: 25),
            timerName: 'Makathar Attack',
          ),
          SimpleTimer.create(
            tag: 'pitOfSnakes',
            timerName: 'Survive in a Pit of Snakes',
            iconName: 'assets/plus.svg',
            duration: const Duration(minutes: 5),
          ),

        ],
      );
}
