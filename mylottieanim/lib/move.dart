import 'package:flutter/material.dart';


class MoveDemo extends StatefulWidget {
  @override
  _MoveDemoState createState() => _MoveDemoState();
}

class _MoveDemoState extends State<MoveDemo> {
  double top = 100.0;  // Initial vertical position
  double left = 100.0; // Initial horizontal position

  void _moveUp() {
    setState(() {
      top = top - 50; // Move Up by 50 pixels
    });
  }

  void _moveDown() {
    setState(() {
      top = top + 50; // Move Down by 50 pixels
    });
  }

  void _moveLeft() {
    setState(() {
      left = left - 50; // Move Left by 50 pixels
    });
  }

  void _moveRight() {
    setState(() {
      left = left + 50; // Move Right by 50 pixels
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Move Animation')),
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(milliseconds: 500), // Speed of movement
            top: top,
            left: left,
            child: Container(
              height: 100,
              width: 100,
              color: Colors.orange,
              child: Center(
                child: Text(
                  'Move Me!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: Column(
              children: [
                ElevatedButton(onPressed: _moveUp, child: Text('Move Up')),
                SizedBox(height: 10),
                ElevatedButton(onPressed: _moveDown, child: Text('Move Down')),
                SizedBox(height: 10),
                ElevatedButton(onPressed: _moveLeft, child: Text('Move Left')),
                SizedBox(height: 10),
                ElevatedButton(onPressed: _moveRight, child: Text('Move Right')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
