import 'dart:async';

import 'package:flutter/material.dart';

class GlitchTextAnimationWidget extends StatefulWidget {
  @override
  _GlitchTextAnimationWidgetState createState() =>
      _GlitchTextAnimationWidgetState();
}

class _GlitchTextAnimationWidgetState extends State<GlitchTextAnimationWidget> {
  String _text = "Glitch Text";
  late Timer _glitchTimer;
  bool _isGlitching = false;

  @override
  void initState() {
    super.initState();

    // Start a timer to simulate glitching
    _glitchTimer = Timer.periodic(Duration(milliseconds: 200), (timer) {
      setState(() {
        _isGlitching = !_isGlitching;
      });
    });
  }

  @override
  void dispose() {
    _glitchTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Glitch Text Animation'),
      ),
      body: Center(
        child: AnimatedDefaultTextStyle(
          style: TextStyle(
            fontSize: 48.0,
            fontWeight: FontWeight.bold,
            color: _isGlitching ? Colors.red : Colors.green,
            decoration: _isGlitching ? TextDecoration.lineThrough : TextDecoration.none,
          ),
          duration: Duration(milliseconds: 200),
          child: Text(_text),
        ),
      ),
    );
  }
}
