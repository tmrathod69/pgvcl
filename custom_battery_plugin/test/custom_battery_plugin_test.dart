import 'package:flutter_test/flutter_test.dart';
import 'package:custom_battery_plugin/custom_battery_plugin.dart';
import 'package:custom_battery_plugin/custom_battery_plugin_platform_interface.dart';
import 'package:custom_battery_plugin/custom_battery_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockCustomBatteryPluginPlatform
    with MockPlatformInterfaceMixin
    implements CustomBatteryPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final CustomBatteryPluginPlatform initialPlatform = CustomBatteryPluginPlatform.instance;

  test('$MethodChannelCustomBatteryPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelCustomBatteryPlugin>());
  });

  test('getPlatformVersion', () async {
    CustomBatteryPlugin customBatteryPlugin = CustomBatteryPlugin();
    MockCustomBatteryPluginPlatform fakePlatform = MockCustomBatteryPluginPlatform();
    CustomBatteryPluginPlatform.instance = fakePlatform;

    expect(await customBatteryPlugin.getPlatformVersion(), '42');
  });
}
