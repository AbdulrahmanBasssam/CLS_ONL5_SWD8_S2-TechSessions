import 'package:flutter/material.dart';

class InteractivityScreen extends StatelessWidget {
  const InteractivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Interactivity Screen")),
      body: Center(
        child: GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text("Container Tapped!")));
          },
          onDoubleTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Container Double Tapped!")),
            );
          },
          onLongPress: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Container Long Pressed!")),
            );
          },
          child: Container(
            width: 200,
            height: 200,
            color: Colors.blue,
            child: const Center(
              child: Text(
                "Tap Me",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PlayWithMe extends StatefulWidget {
  const PlayWithMe({super.key});

  @override
  State<PlayWithMe> createState() => _PlayWithMeState();
}

class _PlayWithMeState extends State<PlayWithMe> {
  Color color = Colors.teal;
  double scale = 1;
  Offset posision = Offset(0, 0);
  double previousScale = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lets Play")),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              color = (color == Colors.teal) ? Colors.black : Colors.teal;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Color Changed!"),
                duration: Duration(milliseconds: 700),
              ),
            );
          },
          onDoubleTap: () {
            setState(() {
              scale = 0.5;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Zoom In!"),
                duration: Duration(milliseconds: 700),
              ),
            );
          },
          onLongPress: () {
            setState(() {
              scale = 1;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Zoom Out!"),
                duration: Duration(milliseconds: 700),
              ),
            );
          },
          onScaleStart: (details) {
            previousScale = scale;
          },
          onScaleUpdate: (details) {
            setState(() {
              posision += details.focalPointDelta;
              scale = (previousScale * details.scale).clamp(0.5, 2.0);
            });
          },
          child: Transform.translate(
            offset: posision,
            child: Transform.scale(
              scale: scale,
              child: Container(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(20),
                ),
                width: 200,
                height: 200,
                alignment: Alignment.center,
                child: Text(
                  "Play with me",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AdvancedInteractivityScreen extends StatefulWidget {
  const AdvancedInteractivityScreen({super.key});

  @override
  State<AdvancedInteractivityScreen> createState() =>
      _AdvancedInteractivityScreenState();
}

class _AdvancedInteractivityScreenState
    extends State<AdvancedInteractivityScreen> {
  Color boxColor = Colors.blue;
  double scale = 1.0;
  Offset position = Offset.zero;

  void showMessage(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Advanced Interactivity")),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              boxColor = boxColor == Colors.blue ? Colors.green : Colors.blue;
            });
            showMessage("Color Changed");
          },

          onDoubleTap: () {
            setState(() {
              scale = 1.2;
            });
            showMessage("Zoom In");
          },

          onLongPress: () {
            setState(() {
              scale = 1.0;
              position = Offset.zero;
            });
            showMessage("Reset");
          },

          onPanUpdate: (details) {
            setState(() {
              position += details.delta;
            });
          },

          child: Transform.translate(
            offset: position,
            child: Transform.scale(
              scale: scale,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: boxColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text(
                    "Play With Me",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class InkWellWidget extends StatelessWidget {
  const InkWellWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("InkWell Widget")),
      body: Center(
        child: InkWell(
          onTap: () {},
          onDoubleTap: () {},
          onLongPress: () {},
          splashColor: Colors.red,
          child: Container(
            width: 200,
            height: 200,
            child: Center(child: Text("InkWell")),
          ),
        ),
      ),
    );
  }
}
