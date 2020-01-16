import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:test_fultter/utils/timeutil.dart';

class LogsStorage {
  static final LogsStorage _sigleton = LogsStorage._();

  static LogsStorage get instance {
    return _sigleton;
  }

  File _file;

  LogsStorage._();

  Future<String> get _localPath async {
    var directory;
    if (Platform.isIOS) {
      directory = await getApplicationDocumentsDirectory();
    } else if (Platform.isAndroid) {
      directory = await getExternalStorageDirectory();
    }
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath + "/flogs/";
    Directory(path).create().then((Directory dir) {
      print(dir.path);
    });
    var file = File("$path${TimeUtil.getDayTime()}.log");
    var isExist = await file.exists();
    if (isExist) {
      print('log file exists');
    } else {
      print('log file not exists');
    }
    return file;
  }

  writeLogs2File(String log) async {
    if (_file == null) {
      _file = await _localFile;
    }
    _file.writeAsStringSync(log, mode: FileMode.writeOnlyAppend);
  }

  Future<String> readlogs2File() async {
    try {
      File file = await _localFile;
      return file.readAsStringSync();
    } catch (e) {
      return 'read logs io error';
    }
  }
}
