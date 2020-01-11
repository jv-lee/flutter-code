import 'package:flutter/material.dart';

/**
 * 复杂列表 item较多的情况使用
 */
class SimpleListBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('simple list builder'),
        ),
        body: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return index % 2 == 0
                ? Container(
                    height: 150,
                    color: Colors.green,
                  )
                : Container(
                    height: 100,
                    color: Colors.yellow,
                  );
          },
        ));
  }
}
