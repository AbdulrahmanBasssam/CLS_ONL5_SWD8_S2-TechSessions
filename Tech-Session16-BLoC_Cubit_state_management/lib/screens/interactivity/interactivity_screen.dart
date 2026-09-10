import 'package:flutter/material.dart';

class InteractivityScreen extends StatefulWidget {
  const InteractivityScreen({super.key});

  @override
  State<InteractivityScreen> createState() => _InteractivityScreenState();
}

class _InteractivityScreenState extends State<InteractivityScreen> {
  String text = "Tap Me!";
  double scale = 1;
  double previousScale = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Interactivity Screen")),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setText("Single Tapped!");
          },
          onDoubleTap: () {
            setText("Double Tapped!");
          },
          onLongPress: () {
            setText("Long Pressed!");
          },
          onScaleStart: (details) {
            previousScale = scale;
          },
          onScaleUpdate: (details) {
            setState(() {
              scale = (previousScale * details.scale).clamp(0.5, 2);
            });
          },
          child: Transform.scale(
            scale: scale,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void setText(String text) {
    setState(() {
      this.text = text;
    });
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        this.text = "Tap Me!";
      });
    });
  }
}
