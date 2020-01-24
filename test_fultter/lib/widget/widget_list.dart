import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_fultter/widget/clip/clip.dart';
import 'package:test_fultter/widget/container.dart';
import 'package:test_fultter/widget/decorated_box.dart';
import 'package:test_fultter/widget/progress.dart';
import 'package:test_fultter/widget/scaffold/scaffold.dart';
import 'package:test_fultter/widget/scaffold/scaffold2.dart';
import 'package:test_fultter/widget/sliver/sliver.dart';

class WidgetList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WidgetList'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
                child: Text('progress'),
                onPressed: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => ProgressPage()));
                }),
            RaisedButton(
              child: Text('decorated box'),
              onPressed: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => DecoratedBoxPage()));
              },
            ),
            RaisedButton(
              child: Text('container'),
              onPressed: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => ContainerPage()));
              },
            ),
            RaisedButton(
              child: Text('scaffold page'),
              onPressed: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => ScaffoldPage()));
              },
            ),
            RaisedButton(
              child: Text('scaffold page 2'),
              onPressed: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => ScaffoldPage2()));
              },
            ),
            RaisedButton(
              child: Text('clip page'),
              onPressed: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => ClipPage()));
              },
            ),
            RaisedButton(
              child: Text('sliver page'),
              onPressed: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => CustomScrollViewTestRoute()));
              },
            )
          ],
        ),
      ),
    );
  }
}
