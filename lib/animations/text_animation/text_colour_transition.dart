import 'package:flutter/material.dart';

class TextColourTransitionAnimationWidget extends StatefulWidget {
  @override
  _TextColourTransitionAnimationWidgetState createState() =>
      _TextColourTransitionAnimationWidgetState();
}

class _TextColourTransitionAnimationWidgetState
    extends State<TextColourTransitionAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    _animation = ColorTween(
      begin: Colors.blue,
      end: Colors.red,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.forward();
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
        title: Text('Text Color Transition Animation'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Text(
              'Animated Text',
              style: TextStyle(
                fontSize: 24.0,
                color: _animation.value,
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_controller.status == AnimationStatus.completed) {
            _controller.reverse();
          } else {
            _controller.forward();
          }
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
