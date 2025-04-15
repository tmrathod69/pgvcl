import 'package:flutter/material.dart';


class SlideDemo extends StatefulWidget {
  @override
  _SlideDemoState createState() => _SlideDemoState();
}

class _SlideDemoState extends State<SlideDemo> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    // Initial animation setup (default position)
    _animation = Tween<Offset>(begin: Offset(0, 0), end: Offset(0, 0)).animate(_controller);
  }

  void _slideUp() {
    setState(() {
      _animation = Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0)).animate(_controller);
      _controller.forward(from: 0);
    });
  }

  void _slideDown() {
    setState(() {
      _animation = Tween<Offset>(begin: Offset(0, -1), end: Offset(0, 0)).animate(_controller);
      _controller.forward(from: 0);
    });
  }

  void _slideLeft() {
    setState(() {
      _animation = Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0)).animate(_controller);
      _controller.forward(from: 0);
    });
  }

  void _slideRight() {
    setState(() {
      _animation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0)).animate(_controller);
      _controller.forward(from: 0);
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
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Slide Animation')),
      body: Stack(
        children: [
          Center(
            child: SlideTransition(
              position: _animation,
              child: Container(
                height: 150,
                width: 150,
                color: Colors.green,
                child: Center(
                  child: Text(
                    'Slide Me!',
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
          Positioned(
            bottom: 20,
            left: 20,
            child: Column(
              children: [
                ElevatedButton(onPressed: _slideUp, child: Text('Slide Up')),
                SizedBox(height: 10),
                ElevatedButton(onPressed: _slideDown, child: Text('Slide Down')),
                SizedBox(height: 10),
                ElevatedButton(onPressed: _slideLeft, child: Text('Slide Left')),
                SizedBox(height: 10),
                ElevatedButton(onPressed: _slideRight, child: Text('Slide Right')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
