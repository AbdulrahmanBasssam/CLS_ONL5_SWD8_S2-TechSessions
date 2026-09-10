import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String name = "Ahmed Ali";
    return Scaffold(
      appBar: AppBar(
        title: Text("First Screen"),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(name, style: TextStyle(fontSize: 20)),
            Text("Hello, from first screen", style: TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final messageFromSecondScreen = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondScreen(name: name, age: 20),
                  ),
                );
                if (messageFromSecondScreen != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(messageFromSecondScreen)),
                  );
                }
              },
              child: Text("Go to Second Screen"),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final String name;
  final int age;
  const SecondScreen({super.key, required this.name, required this.age});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(name, style: TextStyle(fontSize: 20)),
            Text("Age: $age", style: TextStyle(fontSize: 20)),
            Text("Hello, from second screen", style: TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, "Greeting from second screen");
              },
              child: Text("Go back to First Screen"),
            ),
          ],
        ),
      ),
    );
  }
}
