import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BatteryLevelPage extends StatefulWidget {
  @override
  BatteryLevelPageState createState() => BatteryLevelPageState();
}

class BatteryLevelPageState extends State<BatteryLevelPage> {
  static const platform = MethodChannel('samples.flutter.dev/battery');
  String _batteryLevel = 'Unknown battery level.';

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel', {'addValue': 100});
      batteryLevel = 'Battery level at $result%.';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Battery Level'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: _getBatteryLevel,
              child: const Text('Get Battery Level'),
            ),
            Text(_batteryLevel, style: const TextStyle(color: Colors.greenAccent)),
          ],
        ),
      ),
    );
  }
}
