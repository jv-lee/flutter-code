import 'package:flutter/material.dart';

class SimpleRow extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SimpleRowWidget();
  }
}

class SimpleRowWidget extends State<SimpleRow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("simple Row")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            // textDirection: TextDirection.rtl,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text('Hello', style: TextStyle(color: Colors.blue, fontSize: 30)),
              Text('World', style: TextStyle(color: Colors.red, fontSize: 30)),
            ],
          ),
          Row(
            // textDirection: TextDirection.rtl,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Hello', style: TextStyle(color: Colors.blue, fontSize: 30)),
              Text('World', style: TextStyle(color: Colors.red, fontSize: 30)),
            ],
          ),
          Row(
            // textDirection: TextDirection.rtl,
            verticalDirection: VerticalDirection.down,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('Hello', style: TextStyle(color: Colors.blue, fontSize: 60)),
              Text('World', style: TextStyle(color: Colors.red, fontSize: 30)),
            ],
          )
        ],
      ),
    );
  }
}
