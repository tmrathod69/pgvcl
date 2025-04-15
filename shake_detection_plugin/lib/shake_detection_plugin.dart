import 'dart:async';

import 'package:flutter/services.dart';

import 'shake_detection_plugin_platform_interface.dart';

class ShakeDetectionPlugin
{
  static const MethodChannel _channel = MethodChannel('shake_detection_plugin');

  static StreamController<String> _streamController = StreamController();

  static Stream<String> get shakeStream => _streamController.stream;

  static Future<void> startShakeDetection() async {
    _channel.setMethodCallHandler((MethodCall call) async {
      if (call.method == 'onShake') {
        _streamController.add('shakeDetected');
      }
    });
    await _channel.invokeMethod('startShakeDetection');
  }

}
