import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/preparation_examples/bloc.dart';

void main() {
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
      home: AddTaskScreen(),
    );
  }
}
