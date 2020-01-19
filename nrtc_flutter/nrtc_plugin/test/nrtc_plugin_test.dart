import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nrtc_plugin/nrtc_plugin.dart';

void main() {
  const MethodChannel channel = MethodChannel('nrtc_plugin');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await NrtcPlugin.platformVersion, '42');
  });
}
