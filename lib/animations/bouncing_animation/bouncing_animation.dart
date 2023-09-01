import 'package:flutter/material.dart';

class BouncingAnimationWidget extends StatefulWidget {
  @override
  _BouncingAnimationWidgetState createState() => _BouncingAnimationWidgetState();
}

class _BouncingAnimationWidgetState extends State<BouncingAnimationWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.bounceOut, // Use a bounce curve
      ),
    );
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
        title: Text('Bounce Animation'),
      ),
      body: Center(
        child: ScaleTransition(
          scale: _animation,
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
