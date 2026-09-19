import 'package:flutter_bloc/flutter_bloc.dart';
import 'db/remote_db/tasks_remote_db.dart';
import 'task.dart';

// import 'db/local_db/tasks_db.dart';

class TasksCubit extends Cubit<List<Task>> {
  TasksCubit() : super([]) {
    init();
  }

  Future<void> init() async {
    // final tasks = await TasksDb.getTasks();
    final tasks = await TasksRemoteDb.getTasks();
    if (tasks != null && tasks.isNotEmpty) {
      emit(tasks);
    }
  }

  Future<void> addTask(Task task) async {
    final newList = [...state, task];
    emit(newList);
    // await TasksDb.addOrUpdateTask(task);
    await TasksRemoteDb.addTask(task);
  }

  Future<void> removeTask(Task task) async {
    final newList = [...state];
    newList.remove(task);
    emit(newList);
    // await TasksDb.removeTask(task.id);
    await TasksRemoteDb.removeTask(task.id);
  }

  Future<void> removeAllTasks() async {
    final tasks = [...state];
    emit([]);
    // await TasksDb.removeAllTasks();
    await TasksRemoteDb.removeAllTasks(tasks);
  }
}
