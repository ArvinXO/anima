import 'package:flutter/material.dart';

class ColourLoopAnimationWidget extends StatefulWidget {
  @override
  _ColourLoopAnimationWidgetState createState() =>
      _ColourLoopAnimationWidgetState();
}

class _ColourLoopAnimationWidgetState extends State<ColourLoopAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  final List<Color> _colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
  ];
  int _currentColorIndex = 0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_controller);

    _controller.addListener(_updateColorIndex);
    _controller.repeat();
  }

  void _updateColorIndex() {
    if (_controller.status == AnimationStatus.completed) {
      _currentColorIndex = (_currentColorIndex + 1) % _colors.length;
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final foregroundColor = ColorTween(
      begin: _colors[_currentColorIndex],
      end: _colors[(_currentColorIndex + 1) % _colors.length],
    ).animate(_animation);

    return Scaffold(
      backgroundColor: Colors.white, // Background color
      appBar: AppBar(
        title: Text('Color Cycle Animation'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: foregroundColor,
          builder: (context, child) {
            return Container(
              width: 200,
              height: 200,
              color: foregroundColor.value,
              child: Center(
                child: Text(
                  'Foreground',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_controller.isAnimating) {
            _controller.stop();
          } else {
            _controller.repeat();
          }
        },
        child: Icon(
          _controller.isAnimating ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}


