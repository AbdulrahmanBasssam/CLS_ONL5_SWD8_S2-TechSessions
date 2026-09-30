import 'dart:math';

import 'package:flutter/material.dart';

class CustEmplicit extends StatelessWidget {
  const CustEmplicit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CustEmplicit")),
      body: Center(
        child: TweenAnimationBuilder(
          tween: IntTween(begin: 255, end: 0),
          duration: Duration(seconds: 1),
          builder: (context, color, child) {
            return CircleAvatar(
              backgroundColor: Color.fromARGB(
                255,
                color.toInt(),
                (color.toInt() * 2).clamp(0, 255),
                (color.toInt() * 3).clamp(0, 255),
              ),
              radius: 100,
            );
          },
        ),
      ),
    );
  }
}

class CustEmplicit2 extends StatelessWidget {
  const CustEmplicit2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CustEmplicit")),
      body: Center(
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: 8 * pi),
          duration: Duration(seconds: 1),
          builder: (context, angle, child) {
            return Transform.rotate(
              angle: angle,
              child: Text(
                "Hello World!",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CustEmplicit3 extends StatefulWidget {
  const CustEmplicit3({super.key});

  @override
  State<CustEmplicit3> createState() => _CustEmplicit3State();
}

class _CustEmplicit3State extends State<CustEmplicit3> {
  bool isReverse = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: TweenAnimationBuilder(
        tween: isReverse
            ? Tween<double>(begin: 2 * pi, end: 0)
            : Tween<double>(begin: 0, end: 2 * pi),
        duration: Duration(seconds: 2),
        builder: (context, angle, child) {
          return Transform.rotate(
            angle: angle,
            child: Center(
              child: Opacity(
                opacity: angle / (2 * pi),
                child: Icon(Icons.favorite, size: 100, color: Colors.red),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            isReverse = !isReverse;
          });
        },
      ),
    );
  }
}

// values 30 => 100. data type int
// duration 1s;
// child: CircleAvatar
