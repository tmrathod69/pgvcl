import 'package:flutter/material.dart';
import 'package:custom_battery_plugin/custom_battery_plugin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Battery Plugin Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const BatteryLevelPage(),
    );
  }
}

class BatteryLevelPage extends StatefulWidget {
  const BatteryLevelPage({super.key});

  @override
  State<BatteryLevelPage> createState() => _BatteryLevelPageState();
}

class _BatteryLevelPageState extends State<BatteryLevelPage> {
  String _batteryLevel = 'Fetching battery level...';

  @override
  void initState() {
    super.initState();
    _fetchBatteryLevel();
  }

  Future<void> _fetchBatteryLevel() async {
    try {
      final level = await CustomBatteryPlugin.getBatteryLevel();
      setState(() {
        _batteryLevel = 'Battery level: $level%';
      });
    } catch (e) {
      setState(() {
        _batteryLevel = 'Failed to get battery level: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Battery Level')),
      body: Center(child: Text(_batteryLevel, style: const TextStyle(fontSize: 20))),
    );
  }
}
