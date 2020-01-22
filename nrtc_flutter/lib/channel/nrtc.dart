import 'package:flutter/services.dart';

class NrtcEngine implements MethodCall {
  static const MethodChannel _channel = const MethodChannel('nrtc');

  factory NrtcEngine() => _instance;

  static final NrtcEngine _instance = NrtcEngine._();

  NrtcEngine._() {
    _channel.setMethodCallHandler(this);
  }

  /**
   * 创建nrtc sdk 资源
   */
  Future<void> create(String appKey) async {
    assert(appKey != null);
    Map<String, dynamic> args = {'appKey': appKey};
    return await _channel.invokeMethod('create', args);
  }

  /**
   * 释放nrtc sdk 资源
   */
  Future<void> dispose() async {
    return await _channel.invokeMethod('dispose');
  }

  /**
   * 加入房间
   */
  Future<int> joinChannel(String token, String channelName, int uid) async {
    assert(token != null);
    assert(channelName != null);
    assert(uid != null);

    Map<String, dynamic> params = {
      'token': token,
      'channelName': channelName,
      'uid': uid
    };

    return await _channel.invokeMethod('joinChannel', params);
  }

  /**
   * 离开房间
   */
  Future<int> leaveChannel() async {
    return await _channel.invokeMethod('leaveChannel');
  }

  @override
  get arguments => null;

  @override
  String get method => null;
}
