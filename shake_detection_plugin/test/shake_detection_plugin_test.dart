import 'package:flutter_test/flutter_test.dart';
import 'package:shake_detection_plugin/shake_detection_plugin.dart';
import 'package:shake_detection_plugin/shake_detection_plugin_platform_interface.dart';
import 'package:shake_detection_plugin/shake_detection_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockShakeDetectionPluginPlatform
    with MockPlatformInterfaceMixin
    implements ShakeDetectionPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ShakeDetectionPluginPlatform initialPlatform = ShakeDetectionPluginPlatform.instance;

  test('$MethodChannelShakeDetectionPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelShakeDetectionPlugin>());
  });

  test('getPlatformVersion', () async {
    ShakeDetectionPlugin shakeDetectionPlugin = ShakeDetectionPlugin();
    MockShakeDetectionPluginPlatform fakePlatform = MockShakeDetectionPluginPlatform();
    ShakeDetectionPluginPlatform.instance = fakePlatform;

    expect(await shakeDetectionPlugin.getPlatformVersion(), '42');
  });
}
