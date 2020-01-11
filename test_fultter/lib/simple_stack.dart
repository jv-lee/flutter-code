import 'package:flutter/material.dart';

class SimpleStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('simple stack'),
      ),
      // body: test1(),
      body: test2(),
    );
  }
}

Stack test1() {
  return Stack(
    alignment: AlignmentDirectional.topCenter,
    children: <Widget>[
      Container(
        width: 200,
        height: 200,
        color: Colors.red,
      ),
      Container(
        width: 150,
        height: 150,
        color: Colors.green,
      ),
      Container(
        width: 100,
        height: 100,
        color: Colors.yellow,
      )
    ],
  );
}

Stack test2() {
  return Stack(
    children: <Widget>[
      Container(
        color: Colors.red,
      ),
      Positioned(
        top: 100,
        left: 100,
        child: Container(
          width: 150,
          height: 150,
          color: Colors.green,
        ),
      ),
      Container(
        width: 100,
        height: 100,
        color: Colors.yellow,
      )
    ],
  );
}
