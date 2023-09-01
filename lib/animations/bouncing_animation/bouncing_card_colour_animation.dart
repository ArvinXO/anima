import 'package:flutter/material.dart';

class BouncingCardColourAnimationWidget extends StatefulWidget {
  @override
  _BouncingCardColourAnimationWidgetState createState() =>
      _BouncingCardColourAnimationWidgetState();
}

class _BouncingCardColourAnimationWidgetState
    extends State<BouncingCardColourAnimationWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  Color _cardColor = Colors.blue; // Initial card color

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(
      begin: -1.0, // Start off-screen at the top
      end: 0.0, // End at the center of the screen
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticInOut, // Elastic curve for bouncing effect
      ),
    );

    _controller.repeat(reverse: true); // Repeats the animation indefinitely
    _controller.addListener(_updateCardColor); // Listen for animation changes
  }

  void _updateCardColor() {
    // Change the card color based on the animation value
    if (_animation.value < -0.5) {
      _setCardColor(Colors.blue);
    } else if (_animation.value > 0.5) {
      _setCardColor(Colors.green);
    } else {
      _setCardColor(Colors.red);
    }
  }

  void _setCardColor(Color color) {
    setState(() {
      _cardColor = color;
    });
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
        title: Text('Bouncing Card Animation'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, 200 * _animation.value), // Adjust amplitude
              child: Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                color: _cardColor, // Change card color dynamically
                child: Container(
                  width: 300.0,
                  height: 200.0,
                  child: Center(
                    child: Text(
                      'Bouncing Card',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Text color
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: BouncingActionButton(
        backgroundColor: _cardColor, // Set button's color based on card's color
        onPressed: () {
          if (_controller.isAnimating) {
            _controller.stop();
          } else {
            _controller.repeat(reverse: true);
          }
        },
      ),
    );
  }
}

class BouncingActionButton extends StatefulWidget {
  final Color backgroundColor;
  final VoidCallback onPressed;

  BouncingActionButton({
    required this.backgroundColor,
    required this.onPressed,
  });

  @override
  _BouncingActionButtonState createState() => _BouncingActionButtonState();
}

class _BouncingActionButtonState extends State<BouncingActionButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: widget.backgroundColor,
      onPressed: widget.onPressed,
      child: Icon(Icons.play_arrow),
    );
  }
}
