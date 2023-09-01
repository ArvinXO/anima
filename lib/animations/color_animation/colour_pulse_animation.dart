import 'package:flutter/material.dart';

class ColourPulseAnimationWidget extends StatefulWidget {
  @override
  _ColourPulseAnimationWidgetState createState() =>
      _ColourPulseAnimationWidgetState();
}

class _ColourPulseAnimationWidgetState extends State<ColourPulseAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final Color _startColour = Colors.teal.shade900;
  final Color _endColour = Colors.red;
  Color? _currentColour = Colors.blue.shade900; // Initial color (nullable)

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..addListener(() {
      setState(() {
        _currentColour = ColorTween(
          begin: _startColour,
          end: _endColour,
        ).lerp(_controller.value);
      });
    });

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Colour Pulse Animation'),
      ),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          color: _currentColour, // Use the current color
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_controller.isAnimating) {
            _controller.stop();
          } else {
            _controller.repeat(reverse: true);
          }
        },
        child: Icon(
          _controller.isAnimating ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}


