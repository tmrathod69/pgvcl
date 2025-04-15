import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'custom_battery_plugin_method_channel.dart';

abstract class CustomBatteryPluginPlatform extends PlatformInterface {
  /// Constructs a CustomBatteryPluginPlatform.
  CustomBatteryPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static CustomBatteryPluginPlatform _instance = MethodChannelCustomBatteryPlugin();

  /// The default instance of [CustomBatteryPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelCustomBatteryPlugin].
  static CustomBatteryPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CustomBatteryPluginPlatform] when
  /// they register themselves.
  static set instance(CustomBatteryPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
