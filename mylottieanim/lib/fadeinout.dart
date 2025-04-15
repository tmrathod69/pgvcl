import 'package:flutter/material.dart';

class FadeinOut extends StatefulWidget {
  const FadeinOut({super.key});

  @override
  State<FadeinOut> createState() => _FadeinOutState();
}

class _FadeinOutState extends State<FadeinOut>
{
  bool _visible= true;

  @override
  Widget build(BuildContext context) {
    return Center
      (
        child: Column
          (
              mainAxisAlignment: MainAxisAlignment.center,
            children:
            [
              AnimatedOpacity
                (
                  opacity: _visible?1.0:0.0,
                  duration: Duration(seconds: 2),
                  child: Container(
                  height: 200,
                  width: 200,
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      'Hello Flutter!',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                ),
              SizedBox(height: 20,),
              ElevatedButton
                (
                onPressed: () {
                  setState(() {
                    _visible = !_visible; // Toggle visibility
                  });
                },
                child: Text(_visible ? 'Fade Out' : 'Fade In'),
              ),





            ],
          ),
      );
  }
}