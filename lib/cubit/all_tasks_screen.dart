import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'task.dart';

import 'tasks_cubit.dart';

class AllTasksScreen extends StatelessWidget {
  const AllTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All Tasks')),
      body: BlocBuilder<TasksCubit, List<Task>>(
        builder: (context, tasks) {
          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              return ListTile(
                leading: CircleAvatar(child: Text('${index + 1}')),
                title: Text(task.title),
                subtitle: Text(task.description),
                trailing: Checkbox(
                  value: false,
                  onChanged: (bool? value) {
                    if (value != null) {
                      context.read<TasksCubit>().removeTask(task);
                    }
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<TasksCubit>().removeAllTasks();
        },
        child: const Icon(Icons.delete_forever),
      ),
    );
  }
}
