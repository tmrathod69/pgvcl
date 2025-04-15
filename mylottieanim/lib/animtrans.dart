import 'package:flutter/material.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp
      (
      title: 'Flutter Animation & Transition Demo',
      theme: ThemeData
      (
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Button Press State for Scaling
  bool _isPressed = false;

  // Page Transition Animation
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Button Press & Page Transition')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animated button with scaling effect on press
            GestureDetector(
              onTap: ()
              {
                setState(() {
                  _isPressed = !_isPressed;
                });

                // Navigate to the next page with transition after delay
                Future.delayed(Duration(milliseconds: 200), () {
                  Navigator.push(
                    context,
                    _fadeSlideTransition(CustomPage()),  // Use transition while navigating
                  );
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                height: _isPressed ? 70 : 50,
                width: _isPressed ? 200 : 150,
                decoration: BoxDecoration(
                  color: _isPressed ? Colors.blueGrey : Colors.blue,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    'Go to Next Page',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Simple Fade-in Text animation
            AnimatedOpacity(
              opacity: _isPressed ? 1.0 : 0.0,
              duration: Duration(seconds: 1),
              child: Text(
                'Text Fades In After Press',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Custom Fade and Slide Transition
  PageRouteBuilder _fadeSlideTransition(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // Define Slide transition
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        // Define Fade transition
        var fadeAnimation = Tween(begin: 0.0, end: 1.0).animate(animation);

        return SlideTransition(
          position: offsetAnimation,
          child: FadeTransition(opacity: fadeAnimation, child: child),
        );
      },
    );
  }
}

class CustomPage extends StatefulWidget {
  @override
  _CustomPageState createState() => _CustomPageState();
}

class _CustomPageState extends State<CustomPage> {
  bool _isScaled = false; // For Scale Animation

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Custom Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animated scale effect for the text
            GestureDetector(
              onTap: () {
                setState(() {
                  _isScaled = !_isScaled;
                });
              },
              child: AnimatedScale(
                scale: _isScaled ? 1.5 : 1.0,
                duration: Duration(seconds: 1),
                child: Text(
                  'Tap to Scale Text',
                  style: TextStyle(fontSize: 24, color: Colors.blue),
                ),
              ),
            ),
            SizedBox(height: 50),
            // Rotate transition effect on image
            RotationTransition(
              turns: AlwaysStoppedAnimation(45 / 360),
              child: Icon(
                Icons.star,
                size: 80,
                color: Colors.orange,
              ),
            ),
            SizedBox(height: 20),
            // Button with an animated color change
            AnimatedContainer(
              duration: Duration(seconds: 1),
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(12),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  shadowColor: Colors.transparent,
                  elevation: 0,
                ),
                onPressed: () {
                  // Navigating back to the HomePage
                  Navigator.pop(context);
                },
                child: Text(
                  'Back to Home',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
