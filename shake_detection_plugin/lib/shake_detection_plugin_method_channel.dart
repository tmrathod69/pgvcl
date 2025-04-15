import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'shake_detection_plugin_platform_interface.dart';

/// An implementation of [ShakeDetectionPluginPlatform] that uses method channels.
class MethodChannelShakeDetectionPlugin extends ShakeDetectionPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('shake_detection_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
