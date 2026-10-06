import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

class FirebaseUIAuth extends StatelessWidget {
  const FirebaseUIAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return SignInScreen(
      providers: [EmailAuthProvider()],
      headerBuilder: (context, constraints, shrinkOffset) {
        return const Padding(
          padding: EdgeInsets.all(20),
          child: Icon(
            Icons.person_3_outlined,
            size: 50,
            color: Colors.deepPurple,
          ),
        );
      },
      subtitleBuilder: (context, action) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: action == AuthAction.signIn
              ? const Text('Welcome back! Please sign in to continue.')
              : const Text('Create an account to start your Tasks app.'),
        );
      },
      sideBuilder: (context, constraints) {
        return const Padding(
          padding: EdgeInsets.all(20),
          child: Icon(Icons.lock_outline, size: 50, color: Colors.deepPurple),
        );
      },
    );
  }
}
