import 'package:flutter/material.dart';

class BouncingBallAnimationWidget extends StatefulWidget {
  @override
  _BouncingBallAnimationWidgetState createState() =>
      _BouncingBallAnimationWidgetState();
}

class _BouncingBallAnimationWidgetState
    extends State<BouncingBallAnimationWidget>
    with TickerProviderStateMixin {
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
      begin: -1.0, // Start off-screen at the top
      end: 1.0, // End at the bottom
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticInOut, // Elastic curve for bouncing effect
      ),
    );

    _controller.repeat(reverse: true); // Repeats the animation indefinitely
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
        title: Text('Bouncing Ball Animation'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, 200 * _animation.value), // Adjust amplitude
              child: Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
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
            _controller.repeat(reverse: true);
          }
        },
        child: Icon(_controller.isAnimating ? Icons.pause : Icons.play_arrow),
      ),
    );
  }
}
