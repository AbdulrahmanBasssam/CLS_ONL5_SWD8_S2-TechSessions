import 'package:flutter/material.dart';

class DragTargetScreen extends StatelessWidget {
  const DragTargetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Drag Target Screen")),
      body: Center(
        child: Column(
          children: [
            Draggable(
              feedback: Icon(Icons.brush, color: Colors.orange, size: 50),
              childWhenDragging: Column(
                children: [
                  Icon(Icons.palette_outlined, color: Colors.grey, size: 50),
                  Text("Drag Me below to change color"),
                ],
              ),
              data: Colors.deepOrange,
              child: Column(
                children: [
                  Icon(
                    Icons.palette_outlined,
                    color: Colors.deepOrange,
                    size: 50,
                  ),
                  Text(
                    "Drag Me below to change color",
                    style: TextStyle(color: Colors.deepOrange),
                  ),
                ],
              ),
            ),
            Divider(),
            SizedBox(height: 50),
            DragTarget<Color>(
              builder: (context, data, rejectedData) {
                return Container(
                  width: 200,
                  height: 200,
                  color: data.isEmpty ? Colors.grey : data.first,
                  child: Center(child: Text("Drop Here")),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AppleDragScreen extends StatefulWidget {
  const AppleDragScreen({super.key});

  @override
  State<AppleDragScreen> createState() => _AppleDragScreenState();
}

class _AppleDragScreenState extends State<AppleDragScreen> {
  final appleTextWidet = Text('🍎', style: TextStyle(fontSize: 30));
  Widget? sentWidget;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Apple Drag")),
      body: Column(
        children: [
          Draggable(
            feedback: Material(
              color: Colors.transparent,
              child: appleTextWidet,
            ),
            data: appleTextWidet,
            child: appleTextWidet,
          ),
          Divider(),
          SizedBox(height: 30),
          DragTarget<Widget>(
            builder: (context, data, rejectedData) {
              if (data.isNotEmpty) {
                sentWidget = data.first;
              }
              return GestureDetector(
                onDoubleTap: () {
                  setState(() {
                    sentWidget = null;
                  });
                },
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.green,
                  child: Center(child: sentWidget ?? Text("Drop Here ")),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
