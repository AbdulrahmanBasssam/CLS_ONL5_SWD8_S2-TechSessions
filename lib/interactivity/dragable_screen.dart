import 'package:flutter/material.dart';

class DragableScreen extends StatefulWidget {
  const DragableScreen({super.key});

  @override
  State<DragableScreen> createState() => _DragableScreenState();
}

class _DragableScreenState extends State<DragableScreen> {
  Widget? apple;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dragable Screen")),
      body: Center(
        child: Column(
          children: [
            Draggable(
              feedback: Material(
                color: Colors.transparent,
                child: Text('🍎', style: TextStyle(fontSize: 50)),
              ),
              data: Icon(Icons.apple, size: 50, color: Colors.red),
              child: Text('🍎', style: TextStyle(fontSize: 50)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Divider(),
            ),
            DragTarget<Widget>(
              builder: (context, data, rejectedData) {
                if (data.isNotEmpty) {
                  apple = data.first;
                }
                return GestureDetector(
                  onDoubleTap: () {
                    setState(() {
                      apple = null;
                    });
                  },
                  child: Container(
                    width: 200,
                    height: 200,
                    color: Colors.green,
                    child: Center(
                      child:
                          apple ??
                          Text(
                            'Drop Here',
                            style: TextStyle(color: Colors.white, fontSize: 50),
                            textAlign: TextAlign.center,
                          ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
