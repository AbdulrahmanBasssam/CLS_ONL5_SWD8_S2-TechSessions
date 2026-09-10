import 'package:flutter/material.dart';

class DismissibleScreen extends StatefulWidget {
  const DismissibleScreen({super.key});

  @override
  State<DismissibleScreen> createState() => _DismissibleScreenState();
}

class _DismissibleScreenState extends State<DismissibleScreen> {
  List<Map<String, dynamic>> todos = [
    {'title': 'Buy milk', 'desc': '2 liters of low fat', 'done': false},
    {
      'title': 'Study Flutter',
      'desc': 'Complete gesture widgets',
      'done': false,
    },
    {'title': 'Go to gym', 'desc': 'Leg day workout!', 'done': false},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dismissible Screen")),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final todo = todos[index];
          return Dismissible(
            key: UniqueKey(),
            direction: DismissDirection.endToStart,
            background: Container(
              padding: const EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(15),
              ),
              alignment: Alignment.centerRight,
              child: const Icon(Icons.delete, color: Colors.white, size: 30),
            ),
            onDismissed: (direction) {
              todos.removeAt(index);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("${todo['title']} deleted")),
              );
            },
            child: Card(
              child: ListTile(
                leading: Checkbox(
                  value: todo['done'],
                  onChanged: (value) {
                    setState(() {
                      todo['done'] = value!;
                    });
                  },
                ),
                title: Text(
                  todo['title'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: todo['done']
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                subtitle: Text(
                  todo['desc'],
                  style: TextStyle(
                    decoration: todo['done']
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                trailing: Icon(
                  todo['done'] ? Icons.check_circle : Icons.circle_outlined,
                  color: todo['done'] ? Colors.green : Colors.grey,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
