import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InterceptBackPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InterceptBackState();
  }
}

class InterceptBackState extends State<InterceptBackPage> {
  DateTime _lastPressedAt;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('InterceptBack Page'),
      ),
      body: WillPopScope(
          onWillPop: () async {
            if (_lastPressedAt == null ||
                DateTime.now().difference(_lastPressedAt) >
                    Duration(seconds: 1)) {
              //两次点击时间间隔超过1秒则重新计时
              _lastPressedAt = DateTime.now();
              return false;
            }
            return true;
          },
          child: Container(
            alignment: Alignment.center,
            child: Text("1秒内连续按两次返回键退出"),
          )),
    );
  }
}
