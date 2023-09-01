import 'package:flutter/material.dart';

class CrossfadeAnimationWidget extends StatefulWidget {
  @override
  _CrossfadeAnimationWidgetState createState() => _CrossfadeAnimationWidgetState();
}

class _CrossfadeAnimationWidgetState extends State<CrossfadeAnimationWidget> {
  bool _showFirstWidget = true; // A flag to switch between widgets

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crossfade Animation'),
      ),
      body: Center(
        child: AnimatedSwitcher(
          duration: Duration(seconds: 1), // Animation duration
          child: _showFirstWidget
              ? FirstWidget() // First widget to crossfade
              : SecondWidget(), // Second widget to crossfade
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Toggle between the two widgets when the button is pressed
          setState(() {
            _showFirstWidget = !_showFirstWidget;
          });
        },
        child: Icon(Icons.swap_horiz),
      ),
    );
  }
}

class FirstWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      key: UniqueKey(), // Key to identify the widget when switching
      width: 200.0,
      height: 200.0,
      color: Colors.blue,
      child: Center(
        child: Text(
          'Widget 1',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
          ),
        ),
      ),
    );
  }
}

class SecondWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      key: UniqueKey(), // Key to identify the widget when switching
      width: 200.0,
      height: 200.0,
      color: Colors.red,
      child: Center(
        child: Text(
          'Widget 2',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
          ),
        ),
      ),
    );
  }
}
