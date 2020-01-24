import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_fultter/inherited/sharedata.dart';

class InheritedWidgetPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InheritedWidgetState();
  }
}

class InheritedWidgetState extends State<InheritedWidgetPage> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ShareDataWidget(
        data: count,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: TestShareWidget(),
            ),
            RaisedButton(
              child: Text('Increment'),
              onPressed: () => setState(() => ++count),
            )
          ],
        ),
      ),
    );
  }
}
