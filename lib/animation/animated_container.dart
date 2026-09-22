import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerExample extends StatefulWidget {
  const AnimatedContainerExample({super.key});

  @override
  State<AnimatedContainerExample> createState() =>
      _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  double size = 100;
  Color color = Colors.red;
  var borderRadius = BorderRadius.circular(20);
  var margin = const EdgeInsets.only(top: 10);
  void updateContainer() {
    setState(() {
      size = Random().nextInt(300).toDouble().clamp(50, 300);
      color = Color.fromARGB(
        255,
        Random().nextInt(256),
        Random().nextInt(256),
        Random().nextInt(256),
      );
      borderRadius = BorderRadius.circular(Random().nextInt(100).toDouble());
      margin = EdgeInsets.only(top: Random().nextInt(100).toDouble());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animated Container")),
      body: Center(
        child: AnimatedContainer(
          margin: margin,
          curve: Curves.slowMiddle,
          duration: Duration(milliseconds: 300),
          width: size,
          height: size,
          decoration: BoxDecoration(borderRadius: borderRadius, color: color),
          alignment: Alignment.center,
          child: Icon(Icons.person, size: 50, color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: updateContainer,
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
