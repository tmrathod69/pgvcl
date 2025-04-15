import Flutter
import UIKit

public class CustomBatteryPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "custom_battery_plugin", binaryMessenger: registrar.messenger())
    let instance = CustomBatteryPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if call.method == "getBatteryLevel" {
      UIDevice.current.isBatteryMonitoringEnabled = true
      let batteryLevel = UIDevice.current.batteryLevel
      if batteryLevel < 0 {
        result(FlutterError(code: "UNAVAILABLE",
                            message: "Battery level not available.",
                            details: nil))
      } else {
        result(Int(batteryLevel * 100))
      }
    } else {
      result(FlutterMethodNotImplemented)
    }
  }
}
