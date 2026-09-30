import 'package:flutter/material.dart';
import 'animation/explicit_animation.dart';
import 'preparation_examples/animations/exiplicit/explicit_animation.dart';

void main() {
  runApp(MyInitialApp());
}

class MyInitialApp extends StatelessWidget {
  const MyInitialApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExplicitAnimationScreen(),
    );
  }
}
