import 'package:flutter/material.dart';

class MyAnimatedOpacity extends StatefulWidget {
  const MyAnimatedOpacity({super.key});

  @override
  State<MyAnimatedOpacity> createState() => _MyAnimatedOpacityState();
}

class _MyAnimatedOpacityState extends State<MyAnimatedOpacity> {
  double opacity = 0;
  @override
  void initState() {
    super.initState();
    changeOpacity();
  }

  Future<void> changeOpacity() async {
    await Future.delayed(Duration(milliseconds: 500));
    setState(() {
      opacity = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animated Opacity")),
      body: Center(
        child: AnimatedOpacity(
          opacity: opacity,
          duration: Duration(milliseconds: 1000),
          child: Text(
            "Animated Opacity",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.play_arrow),
      //   onPressed: () {
      //     setState(() {
      //       opacity = opacity == 0.3 ? 1.0 : 0.3;
      //     });
      //   },
      // ),
    );
  }
}
