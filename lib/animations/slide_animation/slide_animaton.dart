import 'package:flutter/material.dart';


class SlideAnimationWidget extends StatefulWidget {
  @override
  _SlideAnimationWidgetState createState() => _SlideAnimationWidgetState();
}


class _SlideAnimationWidgetState extends State<SlideAnimationWidget> with TickerProviderStateMixin {
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
        title: Text('Slide Animation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SlideTransition(
              position: Tween<Offset>(
                begin: Offset(0.0, 0.0),
                end: Offset(0.0, -1.0),
              ).animate(
                CurvedAnimation(
                  curve: Curves.easeInOut,
                  parent: _controller,
                ),
              ),
              child: FlutterLogo(size: 200.0),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_position == 0.0) {
            _controller.forward();
          } else {
            _controller.reverse();
          }
          setState(() {
            _position = _position == 0.0 ? 1.0 : 0.0;
          });
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
