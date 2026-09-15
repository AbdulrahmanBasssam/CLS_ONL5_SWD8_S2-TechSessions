import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_r5_s2/cubit/tasks_db.dart';
import 'cubit/add_tasks_screen.dart';
import 'cubit/tasks_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TasksDb.init();
  runApp(
    BlocProvider(create: (context) => TasksCubit(), child: MyInitialApp()),
  );
}

class MyInitialApp extends StatelessWidget {
  const MyInitialApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AddTasksScreen(),
    );
  }
}
