import 'package:flutter/material.dart';


class ZoomControlDemo extends StatefulWidget
{
  @override
  _ZoomControlDemoState createState() => _ZoomControlDemoState();
}

class _ZoomControlDemoState extends State<ZoomControlDemo> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  double _scale = 1.0; // Initial scale value

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _animation = Tween<double>(begin: 1.0, end: 2.0).animate(_controller);
  }

  void _zoomIn() {
    setState(() {
      _scale = 2.0; // Zoom in to double size
      _controller.forward();
    });
  }

  void _zoomOut() {
    setState(() {
      _scale = 1.0; // Zoom out to original size
      _controller.reverse();
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
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text('Zoom In & Zoom Out Buttons')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _animation.value,
                  child: child,
                );
              },
              child: Container(
                height: 150,
                width: 150,
                color: Colors.blue,
                child: Center(
                  child: Text(
                    'Zoom Me!',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _zoomIn,
                  child: Text('Zoom In'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _zoomOut,
                  child: Text('Zoom Out'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
