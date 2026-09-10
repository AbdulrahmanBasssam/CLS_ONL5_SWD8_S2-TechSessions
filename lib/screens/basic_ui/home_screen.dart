import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Counter App",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You have pushed the button this many times:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              counter.toString(),
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                setState(() {
                  counter++;
                });
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.add, color: Colors.teal),
                  Text(
                    "Press Me",
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 18,
                      decoration: TextDecoration.underline,
                      fontStyle: FontStyle.italic,
                      decorationColor: Colors.teal,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
