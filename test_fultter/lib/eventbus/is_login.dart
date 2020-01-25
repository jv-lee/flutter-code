import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_fultter/eventbus/eventbus.dart';
import 'package:test_fultter/eventbus/login.dart';

class IsLoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return IsLoginState();
  }
}

class IsLoginState extends State<IsLoginPage> {
  var text = '暂未登陆';

  @override
  void initState() {
    super.initState();
    bus.on('login', (arg) {
      text = arg;
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    bus.off('login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IsLogin Page'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(text),
            RaisedButton(
              child: Text('登陆'),
              onPressed: () {
                Navigator.push(context, CupertinoPageRoute(builder: (context) {
                  return LoginPage();
                }));
              },
            )
          ],
        ),
      ),
    );
  }
}
