import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Widget Tree')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FirstLineWidget(),
              MiddleWidget(),
              StackWidget(),
              Text('End of the Line'),
            ],
          ),
        ),
      ),
    );
  }
}

class StackWidget extends StatelessWidget {
  const StackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.lightGreen,
      radius: 100.0,
      child: Stack(
        children: <Widget>[
          Container(height: 100.0, width: 100.0, color: Colors.yellow),
          Container(height: 60.0, width: 60.0, color: Colors.amber),
          Container(height: 40.0, width: 40.0, color: Colors.brown),
        ],
      ),
    );
  }
}

class MiddleWidget extends StatelessWidget {
  const MiddleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 32),
        Container(color: Colors.yellow, height: 60.0, width: 60.0),
        const SizedBox(height: 32),
        Container(color: Colors.amber, height: 40.0, width: 40.0),
        const SizedBox(height: 32),
        Container(color: Colors.brown, height: 20.0, width: 20.0),
      ],
    );
  }
}

class FirstLineWidget extends StatelessWidget {
  const FirstLineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          color: Colors.yellow,
          height: 40.0,
          width: 40.0,
          margin: const EdgeInsets.only(right: 32),
        ),
        Expanded(
          child: Container(color: Colors.amber, height: 40.0, width: 40.0),
        ),
        Container(
          color: Colors.brown,
          height: 40.0,
          width: 40.0,
          margin: const EdgeInsets.only(left: 32),
        ),
      ],
    );
  }
}
