import 'package:flutter/material.dart';


class RotateDemo extends StatefulWidget {
  @override
  _RotateDemoState createState() => _RotateDemoState();
}

class _RotateDemoState extends State<RotateDemo> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1), // Rotation speed
    );
  }

  void _rotate() {
    setState(() {
      if (_controller.isCompleted) {
        _controller.reverse(); // Rotate back if already rotated
      } else {
        _controller.forward(); // Rotate forward
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Clean up the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Rotate Animation')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RotationTransition(
              turns: _controller,
              child: Container(
                height: 150,
                width: 150,
                color: Colors.teal,
                child: Center(
                  child: Text(
                    'Rotate Me!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _rotate,
              child: Text('Rotate'),
            ),
          ],
        ),
      ),
    );
  }
}
