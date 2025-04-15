import 'package:flutter/material.dart';

class BlinkScreen extends StatefulWidget
{
  const BlinkScreen({super.key});

  @override
  State<BlinkScreen> createState() => _BlinkScreenState();
}

class _BlinkScreenState extends State<BlinkScreen> with SingleTickerProviderStateMixin
{

  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController
      (
        vsync: this,
        duration: Duration(milliseconds: 500),

    )..repeat(reverse: true);
    animation = Tween<double>(begin: 1.0, end: 0.0).animate(animationController);

  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      backgroundColor: Colors.black,
          body: Center
            (
            child: FadeTransition(
              opacity: animation,
              child: Text(
                'Blinking Text!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            )
      );
  }
}