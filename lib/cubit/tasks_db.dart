import 'package:hive_flutter/hive_flutter.dart';

import 'task.dart';
import 'task_adapter.dart';

class TasksDb {
  static const String boxName = 'tasks';
  static Future<void> init() async {
    await Hive.initFlutter();
    if (!Hive.isAdapterRegistered(TaskAdapter().typeId)) {
      Hive.registerAdapter(TaskAdapter());
    }
    await Hive.openBox<Task>(boxName);
  }

  static Future<void> addOrUpdateTask(Task task) async {
    final box = await Hive.openBox<Task>(boxName);
    await box.put(task.id, task);
  }

  static Future<List<Task>> getTasks() async {
    final box = await Hive.openBox<Task>(boxName);
    return box.values.toList();
  }

  static Future<void> removeTask(String id) async {
    final box = await Hive.openBox<Task>(boxName);
    await box.delete(id);
  }

  static Future<void> removeAllTasks() async {
    final box = await Hive.openBox<Task>(boxName);
    await box.clear();
  }
}
