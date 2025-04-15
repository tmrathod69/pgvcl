import 'package:flutter/material.dart';

class BounceDemo extends StatefulWidget {
  @override
  _BounceDemoState createState() => _BounceDemoState();
}

class _BounceDemoState extends State<BounceDemo> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000), // Duration of the bounce effect
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastEaseInToSlowEaseOut, // Bounce curve
    );

    _controller.repeat(); // Repeating the bounce animation
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Bounce Animation')),
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.scale
              (
                scale: 1 + 0.5 * _animation.value, // Bounce effect
                child: child,
              );
          },
          child: Container(
            height: 150,
            width: 150,
            color: Colors.deepOrange,
            child: Center(
              child: Text(
                'Bounce!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}