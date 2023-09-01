import 'package:flutter/material.dart';

class FadeAndScaleAnimationWidget extends StatefulWidget {
  @override
  _FadeAndScaleAnimationWidgetState createState() => _FadeAndScaleAnimationWidgetState();
}

class _FadeAndScaleAnimationWidgetState extends State<FadeAndScaleAnimationWidget> {
  double _opacity = 0.0; // Initial opacity value
  double _scale = 0.5; // Initial scale value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fade and Scale Animation'),
      ),
      body: Center(
        child: AnimatedOpacity(
          duration: Duration(seconds: 2), // Animation duration
          opacity: _opacity, // Opacity value (controlled by animation)
          child: Transform.scale(
            scale: _scale, // Scale value (controlled by animation)
            child: FlutterLogo(size: 200.0), // Your content
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Trigger the animation by updating the opacity and scale values
          setState(() {
            _opacity = _opacity == 0.0 ? 1.0 : 0.0;
            _scale = _scale == 0.5 ? 1.0 : 0.5;
          });
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
