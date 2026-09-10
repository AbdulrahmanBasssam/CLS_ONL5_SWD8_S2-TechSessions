import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_r5_s2/screens/cubit/task.dart';

class TasksCubit extends Cubit<List<Task>> {
  TasksCubit() : super([]);

  void addTask(Task task) {
    final newList = [...state, task];
    emit(newList);
  }

  void removeTask(Task task) {
    final newList = [...state];
    newList.remove(task);
    emit(newList);
  }

  void removeAllTasks() {
    emit([]);
  }
}
