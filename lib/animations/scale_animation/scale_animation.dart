
import 'package:flutter/material.dart';

class ScaleAnimationWidget extends StatefulWidget {
  @override
  _ScaleAnimationWidgetState createState() => _ScaleAnimationWidgetState();
}

class _ScaleAnimationWidgetState extends State<ScaleAnimationWidget> {
  double _scale = 1.0; // Initial scale value (no scaling)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scale Animation'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 2), // Animation duration
          transform: Matrix4.identity()..scale(_scale), // Scale transformation
          child: FlutterLogo(size: 200.0), // Your content
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Toggle the scale value to trigger the animation
          setState(() {
            _scale = _scale == 1.0 ? 2.0 : 1.0;
          });
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
