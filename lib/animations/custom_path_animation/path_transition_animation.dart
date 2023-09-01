import 'package:flutter/material.dart';

class PathTransitionAnimationWidget extends StatefulWidget {
  @override
  _PathTransitionAnimationWidgetState createState() =>
      _PathTransitionAnimationWidgetState();
}

class _PathTransitionAnimationWidgetState
    extends State<PathTransitionAnimationWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<Offset>(
      begin: Offset(0.0, 0.0),
      end: Offset(1.0, 1.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
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
        title: Text('Path Transition Animation'),
      ),
      body: Center(
        child: SlideTransition(
          position: _animation,
          child: FlutterLogo(size: 200.0),
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
