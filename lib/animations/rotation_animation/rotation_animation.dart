import 'package:flutter/material.dart';

class RotationAnimationWidget extends StatefulWidget {
  @override
  _RotationAnimationWidgetState createState() => _RotationAnimationWidgetState();
}

class _RotationAnimationWidgetState extends State<RotationAnimationWidget> {
  double _rotationAngle = 0.0; // Initial rotation angle (no rotation)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rotation Animation'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 2), // Animation duration
          transform: Matrix4.rotationZ(_rotationAngle), // Rotation transformation
          child: FlutterLogo(size: 200.0), // Your content
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Toggle the rotation angle to trigger the animation
          setState(() {
            _rotationAngle = _rotationAngle == 0.0 ? 0.5 : 0.0;
          });
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
