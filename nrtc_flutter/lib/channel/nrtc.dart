import 'package:flutter/services.dart';

class NrtcEngine {
  static const MethodChannel _channel = const MethodChannel('nrtc');

  factory NrtcEngine() => _instance;

  static final NrtcEngine _instance = NrtcEngine._();

  NrtcEngine._();

  Future<void> create(String appKey) async {
    assert(appKey != null);
    Map<String, dynamic> args = {'appKey': appKey};
    return await _channel.invokeMethod('create', args);
  }

  Future<void> dispose() async {
    return await _channel.invokeMethod('dispose');
  }
}
