import 'package:flutter_bloc/flutter_bloc.dart';
import 'task.dart';
import 'tasks_db.dart';

class TasksCubit extends Cubit<List<Task>> {
  TasksCubit() : super([]) {
    init();
  }

  Future<void> init() async {
    final tasks = await TasksDb.getTasks();
    if (tasks.isNotEmpty) {
      emit(tasks);
    }
  }

  Future<void> addTask(Task task) async {
    final newList = [...state, task];
    emit(newList);
    await TasksDb.addOrUpdateTask(task);
  }

  Future<void> removeTask(Task task) async {
    final newList = [...state];
    newList.remove(task);
    emit(newList);
    await TasksDb.removeTask(task.id);
  }

  Future<void> removeAllTasks() async {
    emit([]);
    await TasksDb.removeAllTasks();
  }
}
