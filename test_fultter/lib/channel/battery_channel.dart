import 'package:flutter/services.dart';

class BatteryLevel {
  static const MethodChannel _channel =
      const MethodChannel('simple.flutter.io/battery');

  Future<int> getBatteryLevel() async {
    return await _channel.invokeMethod('getBatteryLevel');
  }
}
