import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nrtc_flutter/channel/nrtc.dart';
import 'package:nrtc_flutter/config.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<HomePage> {
  var _engine = NrtcEngine();

  @override
  void initState() {
    super.initState();
    initNRtcEngine();
  }

  Future<void> initNRtcEngine() async {
    _engine = NrtcEngine();
    _engine.create(Config.APP_KEY);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home - Page。'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            MaterialButton(
              child: Text('create rtc connection'),
              onPressed: () => print('connection rtc session'),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _engine.dispose();
  }
}
