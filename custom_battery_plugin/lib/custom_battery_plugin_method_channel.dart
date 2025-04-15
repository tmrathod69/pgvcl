import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'custom_battery_plugin_platform_interface.dart';

/// An implementation of [CustomBatteryPluginPlatform] that uses method channels.
class MethodChannelCustomBatteryPlugin extends CustomBatteryPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('custom_battery_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
