import 'package:flutter/material.dart';

class SquaresScreen extends StatelessWidget {
  const SquaresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Squares Screen"),
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.white,
      ),
      body: Center(child: MyRow()),
    );
  }
}

class MyRow extends StatelessWidget {
  const MyRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(width: 80, height: 80, color: Colors.red),
        Container(
          width: 80,
          height: 80,
          color: Colors.yellow,
          child: Icon(Icons.person),
        ),
        Container(width: 80, height: 80, color: Colors.green),
      ],
    );
  }
}
