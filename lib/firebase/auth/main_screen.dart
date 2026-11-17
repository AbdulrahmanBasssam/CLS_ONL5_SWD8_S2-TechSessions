import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../cubit/add_tasks_screen.dart';
import 'auth_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, userSnapshot) {
        if (userSnapshot.hasData && userSnapshot.data != null) {
          return AddTasksScreen();
        } else {
          return FirebaseUIAuth();
        }
      },
    );
  }
}

// show user data in home screen
// implement sign out button in home screen .. done
