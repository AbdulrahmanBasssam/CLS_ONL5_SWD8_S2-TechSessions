import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../task.dart';

class Firebasedb {
  static final _db = FirebaseFirestore.instance;
  static const usersCollectionName = "users";
  static const tasksCollectionName = "tasks";

  // كل اما يحصل تحديث في كولكشن التاسكات .. يبعتلي لقطه لكل التاسكات بعد اخر تحديث
  static Stream<List<Task>> getTasks() {
    final tasksCollectionRef = _db
        .collection(usersCollectionName)
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection(tasksCollectionName);

    final tasksDataStream = tasksCollectionRef.snapshots();
    // convert stream of QuerySnapshot<Map<String, dynamic>> to stream of List<Task>

    Stream<List<Task>> tasksStream = tasksDataStream.map((querySnapshot) {
      final tasksDocs = querySnapshot.docs;
      final List<Task> tasks = [];
      for (final doc in tasksDocs) {
        final taskMap = doc.data();
        final task = Task.fromMap(taskMap);
        tasks.add(task);
      }
      return tasks;
    });
    return tasksStream;
  }

  static Future<void> addTask(Task task) async {
    final tasksCollectionRef = getTasksCollectionRef();

    final docRef = tasksCollectionRef.doc();
    task.id = docRef.id;
    await docRef.set(task.toMap());
  }

  static Future<void> updateTask(Task task) async {
    final tasksCollectionRef = getTasksCollectionRef();

    await tasksCollectionRef.doc(task.id).update(task.toMap());
  }

  static Future<void> deleteTask(Task task) async {
    final tasksCollectionRef = getTasksCollectionRef();

    await tasksCollectionRef.doc(task.id).delete();
  }

  static Future<void> deleteAllTask() async {
    final tasksCollectionRef = getTasksCollectionRef();

    final tasksSnapshot = await tasksCollectionRef.get();
    for (final doc in tasksSnapshot.docs) {
      await doc.reference.delete();
    }
  }

  static CollectionReference<Map<String, dynamic>> getTasksCollectionRef() {
    return _db
        .collection(usersCollectionName)
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection(tasksCollectionName);
  }
}

// link db with cubit
