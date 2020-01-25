import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_fultter/eventbus/eventbus.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Login'),
          onPressed: () {
            bus.emit('login', '已登陆');
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
