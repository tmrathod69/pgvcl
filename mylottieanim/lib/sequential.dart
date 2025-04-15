import 'package:flutter/material.dart';


class SequentialDemo extends StatefulWidget {
  @override
  _SequentialDemoState createState() => _SequentialDemoState();
}

class _SequentialDemoState extends State<SequentialDemo> with TickerProviderStateMixin {
  late AnimationController _controller1, _controller2, _controller3;
  late Animation<double> _animation1, _animation2, _animation3;

  @override
  void initState() {
    super.initState();

    // First Animation Controller
    _controller1 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _animation1 = Tween<double>(begin: 0, end: 1).animate(_controller1);

    // Second Animation Controller
    _controller2 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _animation2 = Tween<double>(begin: 0, end: 1).animate(_controller2);

    // Third Animation Controller
    _controller3 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _animation3 = Tween<double>(begin: 0, end: 1).animate(_controller3);
  }

  void _startSequentialAnimation() async {
    await _controller1.forward();
    await _controller2.forward();
    await _controller3.forward();
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Sequential Animation')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _animation1,
              builder: (context, child) {
                return Transform.scale(
                  scale: _animation1.value,
                  child: Container(
                    height: 80,
                    width: 80,
                    color: Colors.red,
                    child: Center(child: Text('1', style: TextStyle(color: Colors.white))),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            AnimatedBuilder(
              animation: _animation2,
              builder: (context, child) {
                return Transform.scale(
                  scale: _animation2.value,
                  child: Container(
                    height: 80,
                    width: 80,
                    color: Colors.green,
                    child: Center(child: Text('2', style: TextStyle(color: Colors.white))),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            AnimatedBuilder(
              animation: _animation3,
              builder: (context, child) {
                return Transform.scale(
                  scale: _animation3.value,
                  child: Container(
                    height: 80,
                    width: 80,
                    color: Colors.blue,
                    child: Center(child: Text('3', style: TextStyle(color: Colors.white))),
                  ),
                );
              },
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _startSequentialAnimation,
              child: Text('Start Animation'),
            ),
          ],
        ),
      ),
    );
  }
}
