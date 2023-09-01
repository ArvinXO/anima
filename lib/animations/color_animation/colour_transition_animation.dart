import 'package:flutter/material.dart';

class ColourTransitionAnimationWidget extends StatefulWidget {
  @override
  _ColorTransitionAnimationWidgetState createState() =>
      _ColorTransitionAnimationWidgetState();
}

class _ColorTransitionAnimationWidgetState
    extends State<ColourTransitionAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    _colorAnimation = ColorTween(
      begin: Colors.blue,
      end: Colors.green,
    ).animate(_controller);

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
        title: Text('Color Transition Animation'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _colorAnimation,
          builder: (context, child) {
            return Container(
              width: 200,
              height: 200,
              color: _colorAnimation.value,
            );
          },
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
