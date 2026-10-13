import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_r5_s2/cubit/tasks_cubit.dart';
import 'firebase/auth/main_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseMessaging.instance.requestPermission();
  final notificationToken = await FirebaseMessaging.instance.getToken();
  print("notificationToken");
  print(notificationToken);

  runApp(MyInitialApp());
}

class MyInitialApp extends StatelessWidget {
  const MyInitialApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksCubit(),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: MainScreen()),
    );
  }
}
