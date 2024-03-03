import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';

class HiveDataStore {
  static int currentId = 0;
  Future<void> init() async {
    await Hive.initFlutter();
    // register adapters
    // Hive.registerAdapter<Task>(TaskAdapter());
    // Hive.registerAdapter<TaskState>(TaskStateAdapter());
    // open boxes
    // await Hive.openBox<Task>(frontTasksBoxName);
    // await Hive.openBox<Task>(backTasksBoxName);
    // await Hive.openBox<TaskState>(tasksStateBoxName);
  }
}

final dataStoreProvider = Provider<HiveDataStore>((ref) {
  throw UnimplementedError();
});
