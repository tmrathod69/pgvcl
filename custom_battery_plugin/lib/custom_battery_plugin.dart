import 'package:flutter/services.dart';

class CustomBatteryPlugin {
  static const MethodChannel _channel = MethodChannel('custom_battery_plugin');

  static Future<int?> getBatteryLevel() async {
    final int? batteryLevel = await _channel.invokeMethod('getBatteryLevel');
    return batteryLevel;
  }
}
