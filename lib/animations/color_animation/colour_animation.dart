import 'package:flutter/material.dart';

class ColourAnimationWidget extends StatefulWidget {
  @override
  _ColourAnimationWidgetState createState() => _ColourAnimationWidgetState();
}

class _ColourAnimationWidgetState extends State<ColourAnimationWidget> {
  Color _color = Colors.blue; // Initial color value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Animation'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 2), // Animation duration
          color: _color, // Color property to be animated
          width: 200.0,
          height: 200.0,
          child: FlutterLogo(), // Your content
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Toggle the color to trigger the animation
          setState(() {
            _color = _color == Colors.blue ? Colors.green : Colors.blue;
          });
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
