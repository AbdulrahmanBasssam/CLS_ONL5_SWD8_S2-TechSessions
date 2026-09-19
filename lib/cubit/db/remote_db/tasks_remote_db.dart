import 'dart:convert';
import 'package:http/http.dart';
import '../../task.dart';

class TasksRemoteDb {
  static const String baseUrl =
      'https://6aaebf7b606bd915d11106cf.mockapi.io/tasks-management/';
  static Future<bool> addTask(Task task) async {
    // convert task object to map .. to json
    // send post request (body: json, header: data type)

    final taskMap = task.toMap();
    final taskJson = jsonEncode(taskMap);

    final response = await post(
      Uri.parse("$baseUrl/tasks"),
      body: taskJson,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  static Future<List<Task>?> getTasks() async {
    final response = await get(Uri.parse("$baseUrl/tasks"));
    if (response.statusCode == 200 || response.statusCode == 201) {
      final tasksJson = response.body;
      final tasksMap = jsonDecode(tasksJson) as List;

      List<Task> tasks = [];
      for (var taskMap in tasksMap) {
        tasks.add(Task.fromMap(taskMap));
      }
      return tasks;
    } else {
      return null;
    }
  }

  static Future<bool> removeTask(String id) async {
    final response = await delete(Uri.parse("$baseUrl/tasks/$id"));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> removeAllTasks(List<Task> tasks) async {
    for (var task in tasks) {
      await removeTask(task.id);
    }
    return true;
  }
}
