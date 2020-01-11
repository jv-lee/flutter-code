import 'package:flutter/material.dart';

/**
 * 简单gird布局item 数量
 */
class SimpleGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('simple gridview'),
      ),
      body: GridView(
          children: <Widget>[
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.red,
            ),
          ],
          gridDelegate:
              // 设置固定每一行个数
              // SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 3, // 每一行3个
              //     childAspectRatio: 2.0 // 每一个的宽高比
              //     ),

              //设置最大宽度比例 自动适配个数排列
              SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 100, childAspectRatio: 2.0)),
    );
  }
}

class SimpleGridView2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('simple girdView - count'),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 2.0,
        children: <Widget>[
          Container(
            color: Colors.black,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}

class SimpleGirdView3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('simpleGridView - extent'),
      ),
      body: GridView.extent(
        maxCrossAxisExtent: 100,
        childAspectRatio: 2.0,
        children: <Widget>[
          Container(
            color: Colors.black,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}

class SimpleGirdViewBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('simple girdView builder'),
      ),
      body: GridView.builder(
        physics: BouncingScrollPhysics(),
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          return index % 2 == 0
              ? Container(
                  color: Colors.black,
                )
              : Container(
                  color: Colors.red,
                );
        },
        itemCount: 30,
      ),
    );
  }
}
