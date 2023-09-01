import 'package:flutter/material.dart';

class FadeAnimationWidget extends StatefulWidget {
  @override
  _FadeAnimationWidgetState createState() => _FadeAnimationWidgetState();
}

class _FadeAnimationWidgetState extends State<FadeAnimationWidget> {
  double _opacity = 1.0; // Initial opacity value (fully visible)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fade Animation'),
      ),
      body: Center(
        child: AnimatedOpacity(
          duration: Duration(seconds: 2), // Animation duration
          opacity: _opacity, // Opacity value (controlled by animation)
          child: FlutterLogo(size: 200.0), // Your content
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Toggle the opacity value to trigger the animation
          setState(() {
            _opacity = _opacity == 0.0 ? 1.0 : 0.0;
          });
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}


