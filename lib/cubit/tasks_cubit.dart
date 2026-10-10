import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'db/firebase_db/firebasedb.dart';
import 'task.dart';

// import 'db/local_db/tasks_db.dart';

class TasksCubit extends Cubit<List<Task>> {
  TasksCubit() : super([]) {
    init();
  }

  Future<void> init() async {
    Firebasedb.getTasks().listen((tasks) {
      emit(tasks);
    });
  }

  Future<void> addTask(Task task) async {
    await Firebasedb.addTask(task);
  }

  Future<void> removeTask(Task task) async {
    await Firebasedb.deleteTask(task);
  }

  Future<void> removeAllTasks() async {
    await Firebasedb.deleteAllTask();
  }

  Future<void> signOut() async {
    emit([]);
    await FirebaseAuth.instance.signOut();
  }
}
