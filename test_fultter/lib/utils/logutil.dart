import 'package:flutter/widgets.dart';
import 'package:test_fultter/utils/logstorage.dart';
import 'package:test_fultter/utils/timeutil.dart';

enum Level { DEBUG, INFO, WARNING, ERROR }

bool get isDebugMode {
  bool debugMode = false;
  assert(debugMode = true); //断言 线上环境会被清除
  return debugMode;
}

class LogUtil {
  static Level LogLevel = Level.DEBUG;

  static final LogsStorage storage = LogsStorage.instance;

  static d({String tag, @required String content}) {
    _log2File(Level.DEBUG, tag ?? "DEBUG", content);
  }

  static i({String tag, @required String content}) {
    _log2File(Level.INFO, tag ?? "INFO", content);
  }

  static w({String tag, @required String content}) {
    _log2File(Level.WARNING, tag ?? "WARNING", content);
  }

  static e({String tag, @required String content}) {
    _log2File(Level.ERROR, tag ?? "ERROR", content);
  }

  static void _log2File(Level level, String tag, String content) {
    String log = _formatLog(level, tag, content);
    if (isDebugMode) {
      print(log);
    }
    if (level.index >= LogLevel.index) {
      storage.writeLogs2File(log);
    }
  }

  static String _formatLog(Level level, String tag, String content) {
    String log = "${level.toString()} ";
    log += "${TimeUtil.getCurrentFullTime()} ";
    log += "$tag ";
    log += "$content\n";
    return log;
  }
}
