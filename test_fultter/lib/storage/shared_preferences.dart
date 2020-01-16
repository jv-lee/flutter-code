import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_fultter/utils/logutil.dart';
import 'package:uuid/uuid.dart';

/**
 *  本案例使用库 
 *  shared_preferences: 0.5.4+6
 *  uuid: 2.0.4
 */
class SharedPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SharedState();
  }
}

class SharedState extends State<SharedPage> {
  var uuidStr = "undifaid";

  void uuidUpdate() async {
    var sp = await SharedPreferences.getInstance();
    uuidStr = sp.get('uuid');

    if (uuidStr == null) {
      uuidStr = Uuid().v4();
      sp.setString('uuid', uuidStr);
    }
    LogUtil.d(content: "uuid -> $uuidStr");

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shared Preferences Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text(uuidStr)],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: uuidUpdate,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
