import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:shake_detection_plugin/shake_detection_plugin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color _backgroundColor = Colors.white;
  static const EventChannel _shakeEventChannel =
      EventChannel('shake_detection_plugin/shake_event');
  @override
  void initState()
  {
    // Listen for shake events from the native side
    _shakeEventChannel.receiveBroadcastStream().listen((_) {
      // Change the background color after receiving the second shake event
      setState(() {
        _backgroundColor = _backgroundColor == Colors.red ? Colors.blue : Colors.red;
      });
    });
  }

  Widget build(BuildContext context)
  {
    return MaterialApp
      (
        home: Scaffold
          (
            appBar: AppBar(title: Text('My Plugin'),),
            body: Container
              (
                color: _backgroundColor,
              child: Center
                (
                  child: Text
                    ('shake the Device twice to change color',
                     textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                  ),
              )
            )
        )
    );
  }
}

