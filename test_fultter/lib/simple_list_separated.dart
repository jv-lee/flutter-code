import 'package:flutter/material.dart';

/**
 * 复杂列表 item数据多使用
 * 该构造会有下划线
 */
class SimpleListSeparated extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('simple list separated'),
      ),
      body: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return index % 2 == 0
              ? Container(
                  height: 100,
                  color: Colors.blue,
                )
              : Container(
                  height: 200,
                  color: Colors.red,
                );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 2.0,
            color: Colors.black,
            thickness: 2.0,
          );
        },
        itemCount: 10,
      ),
    );
  }
}
