import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DrawingAnimation extends StatelessWidget {
  const DrawingAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Lottie.asset("assets/animations/HRInterview.json")),
    );
  }
}
