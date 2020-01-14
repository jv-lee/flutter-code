import 'package:flutter/material.dart';

/**
 * 弹性布局
 */
class SimpleFlex extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SimpleFlexWidget();
  }
}

class SimpleFlexWidget extends State<SimpleFlex> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Flex'),
      ),
      body: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.red,
              height: 50,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.blue,
              height: 50,
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.yellow,
              height: 50,
            ),
          ),
        ],
      ),
    );
  }
}
