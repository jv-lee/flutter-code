import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ContainerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ContainerPage'),
      ),
      body: Container(
        margin: EdgeInsets.all(30),
        padding: EdgeInsets.all(30),
        child: Container(
          color: Colors.red,
        ),
      ),
    );
  }
}
