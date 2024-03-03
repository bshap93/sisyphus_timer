import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sisyphus_timer/data/models/timers/simple_timer/simple_timer.dart';
import 'package:sisyphus_timer/data/persistence/hive_data_store.dart';
import 'package:sisyphus_timer/presentation/timer/simple_timer_with_name.dart';

class SimpleTimerWithNameLoader extends ConsumerWidget {
  const SimpleTimerWithNameLoader({required this.simpleTimer, super.key});
  final SimpleTimer simpleTimer;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataStore = ref.watch(dataStoreProvider);
    return Builder(
      builder: (context) => SimpleTimerWithName(
        simpleTimer: simpleTimer,
      ),
    );
  }
}
