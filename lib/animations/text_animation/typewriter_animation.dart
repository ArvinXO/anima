import 'package:flutter/material.dart';

class TypewriterTextAnimationWidget extends StatefulWidget {
  @override
  _TypewriterTextAnimationWidgetState createState() =>
      _TypewriterTextAnimationWidgetState();
}

class _TypewriterTextAnimationWidgetState
    extends State<TypewriterTextAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    _animation = IntTween(
      begin: 0,
      end: "Animated Text".length,
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
        title: Text('Typewriter Text Animation'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            final text = "Animated Text".substring(0, _animation.value);
            return Text(
              text,
              style: TextStyle(fontSize: 24.0),
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
