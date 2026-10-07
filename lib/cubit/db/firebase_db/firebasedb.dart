import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../task.dart';

class Firebasedb {
  static final _db = FirebaseFirestore.instance;
  static const usersCollectionName = "users";
  static const tasksCollectionName = "tasks";
  static Stream<List<Task>> getTasks() {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      return Stream.value([]);
    }
    final tasksCollection = _db
        .collection(usersCollectionName)
        .doc(userId)
        .collection(tasksCollectionName);

    final tasksDataStream = tasksCollection.snapshots();
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
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      return;
    }
    final tasksCollection = _db
        .collection(usersCollectionName)
        .doc(userId)
        .collection(tasksCollectionName);
    final docRef = tasksCollection.doc();
    task.id = docRef.id;
    await docRef.set(task.toMap());
  }

  static Future<void> updateTask(Task task) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      return;
    }
    final tasksCollection = _db
        .collection(usersCollectionName)
        .doc(userId)
        .collection(tasksCollectionName);
    await tasksCollection.doc(task.id).update(task.toMap());
  }

  static Future<void> deleteTask(Task task) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      return;
    }
    final tasksCollection = _db
        .collection(usersCollectionName)
        .doc(userId)
        .collection(tasksCollectionName);
    await tasksCollection.doc(task.id).delete();
  }

  static Future<void> deleteAllTask(Task task) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      return;
    }
    final tasksCollection = _db
        .collection(usersCollectionName)
        .doc(userId)
        .collection(tasksCollectionName);
    final tasksSnapshot = await tasksCollection.get();
    for (final doc in tasksSnapshot.docs) {
      await doc.reference.delete();
    }
  }
}

// get tasks (stream)
