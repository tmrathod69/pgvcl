import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'shake_detection_plugin_method_channel.dart';

abstract class ShakeDetectionPluginPlatform extends PlatformInterface {
  /// Constructs a ShakeDetectionPluginPlatform.
  ShakeDetectionPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static ShakeDetectionPluginPlatform _instance = MethodChannelShakeDetectionPlugin();

  /// The default instance of [ShakeDetectionPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelShakeDetectionPlugin].
  static ShakeDetectionPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ShakeDetectionPluginPlatform] when
  /// they register themselves.
  static set instance(ShakeDetectionPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
