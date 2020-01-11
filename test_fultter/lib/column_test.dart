import 'package:flutter/material.dart';

class SimpleColumn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SimpleColumnWidget();
  }
}

class SimpleColumnWidget extends State<SimpleColumn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Column'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Hello',
            style: TextStyle(color: Colors.green, fontSize: 50),
          ),
          Text(
            'Fullter',
            style: TextStyle(color: Colors.grey, fontSize: 30),
          )
        ],
      ),
    );
  }
}
