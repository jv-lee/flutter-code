import 'package:flutter/material.dart';
import 'package:test_fultter/channel/battery_channel.dart';

class BatteryTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BatterState();
  }
}

class BatterState extends State<BatteryTest> {
  BatteryLevel batteryLevel = BatteryLevel();
  var batteryNumber = -1;

  @override
  void initState() {
    super.initState();
    print('init Battery begin');
    initBattery();
    print('init Battery end');
  }

  Future<void> initBattery() async {
    int battery = await batteryLevel.getBatteryLevel();
    print("123");
    print("电量为：$battery");
    setState(() {
      batteryNumber = battery;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Channel Battery Page'),
      ),
      body: Center(
        child: Text('battery - $batteryNumber'),
      ),
    );
  }
}
