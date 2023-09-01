import 'package:flutter/material.dart';

class FlipAnimationWidget extends StatefulWidget {
  @override
  _FlipAnimationWidgetState createState() => _FlipAnimationWidgetState();
}

class _FlipAnimationWidgetState extends State<FlipAnimationWidget>
    with SingleTickerProviderStateMixin {
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
        curve: Curves.easeInOut,
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
        title: Text('Flip Animation'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            final transform = Matrix4.identity()
              ..rotateY(2 * 3.14159265359 * _animation.value);
            return Transform(
              transform: transform,
              alignment: Alignment.center,
              child: FlutterLogo(size: 200.0),
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
