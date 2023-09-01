import 'package:flutter/material.dart';

class CombinationAnimationWidget extends StatefulWidget {
  @override
  _CombinationAnimationWidgetState createState() =>
      _CombinationAnimationWidgetState();
}

class _CombinationAnimationWidgetState
    extends State<CombinationAnimationWidget> with TickerProviderStateMixin {
  double _scale = 1.0;
  double _rotationAngle = 90.0;
  double _position = 0.0;

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
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
        title: Text('Combination Animation'),
      ),
      body: Center(
        child: Transform.scale(
          scale: _scale,
          child: Transform.rotate(
            angle: _rotationAngle,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: Offset(0.0, 0.0),
                end: Offset(0.0, 0.0),
              ).animate(
                CurvedAnimation(
                  curve: Curves.easeInOut,
                  parent: AnimationController(
                    duration: Duration(seconds: 2),
                    vsync: this,
                  ),
                ),
              ),
              child: FlutterLogo(size: 200.0),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _scale = _scale == 1.0 ? 3.0 : 1.0;
            _rotationAngle = _rotationAngle == 0.0 ? 0.5 : 0.0;
            _position = _position == 0.0 ? 1.0 : 0.0;
          });
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
