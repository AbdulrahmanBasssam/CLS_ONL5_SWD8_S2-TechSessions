import 'package:flutter/material.dart';

class AnimatedCrossfadeExample extends StatefulWidget {
  const AnimatedCrossfadeExample({super.key});

  @override
  State<AnimatedCrossfadeExample> createState() =>
      _AnimatedCrossfadeExampleState();
}

class _AnimatedCrossfadeExampleState extends State<AnimatedCrossfadeExample> {
  var crossFadeState = CrossFadeState.showFirst;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animated Crossfade")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedCrossFade(
              firstChild: CircleAvatar(
                radius: 100,
                backgroundColor: Colors.black,
                child: Icon(Icons.person, size: 100, color: Colors.white),
              ),
              secondChild: CircleAvatar(
                radius: 100,
                backgroundColor: Colors.blue,
                backgroundImage: NetworkImage(
                  "https://www.shutterstock.com/image-photo/handsome-happy-african-american-bearded-260nw-2460702995.jpg",
                ),
              ),
              crossFadeState: crossFadeState,
              duration: Duration(seconds: 1),
              sizeCurve: Curves.elasticInOut,
              firstCurve: Curves.fastOutSlowIn,
              secondCurve: Curves.fastOutSlowIn,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  crossFadeState = crossFadeState == CrossFadeState.showFirst
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst;
                });
              },
              child: Text("Switch Image"),
            ),
          ],
        ),
      ),
    );
  }
}
