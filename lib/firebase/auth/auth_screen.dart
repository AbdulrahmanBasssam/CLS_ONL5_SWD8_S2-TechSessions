import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

class FirebaseUIAuth extends StatelessWidget {
  const FirebaseUIAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return SignInScreen(
      providers: [EmailAuthProvider()],
      actions: [
        AuthStateChangeAction<SignedIn>((context, state) {
          FirebaseMessaging.instance.subscribeToTopic('signed_in_users');
        }),
      ],
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

class CustomLogin extends StatefulWidget {
  const CustomLogin({super.key});

  @override
  State<CustomLogin> createState() => _CustomLoginState();
}

class _CustomLoginState extends State<CustomLogin> {
  final formKey = GlobalKey<FormState>();
  String name = '';
  String password = '';
  String errorMessage = '';
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Email is required";
                  }
                  return null;
                },
                onSaved: (newValue) {
                  name = newValue!;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Password is required";
                  }
                  return null;
                },
                onSaved: (newValue) {
                  password = newValue!;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: isLoading
                    ? SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Login'),
                onPressed: () async {
                  setState(() {
                    errorMessage = '';
                  });
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    setState(() {
                      isLoading = true;
                    });
                    try {
                      await auth.FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                            email: name,
                            password: password,
                          );
                    } on auth.FirebaseAuthException catch (e) {
                      setState(() {
                        errorMessage = _friendlyMessageFromCode(e.code);
                      });
                    } finally {
                      setState(() {
                        isLoading = false;
                      });
                    }
                  }
                },
              ),
              if (errorMessage.isNotEmpty) ...[
                SizedBox(height: 20),
                Text(
                  errorMessage,
                  style: TextStyle(color: Colors.red, fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  String _friendlyMessageFromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return 'The supplied email address is not valid.';
      case 'invalid-credential':
        return 'The supplied auth credential is not valid.';
      case 'user-disabled':
        return 'This account has been disabled. Contact support.';
      case 'user-not-found':
        return 'No account found for that email.';
      case 'wrong-password':
        return 'Incorrect password. Try again or reset your password.';
      case 'too-many-requests':
        return 'Too many attempts. Try again later.';
      case 'network-request-failed':
        return 'Network error. Check your connection.';
      default:
        return 'Sign in failed. Please try again.';
    }
  }
}
