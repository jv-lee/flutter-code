import 'package:flutter/material.dart';

/**
 * 简单的数据展示 不适合大量数据加载
 */
class SimpleList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('simple list'),
      ),
      body: ListView(
        /**
         * 滚动模式 
         * 1.NeverScrollablePhysics  不可滚动 
         * 2.BouncingScrollPhysics ios 弹性滚动 
         * 3.ClampingScrollPhysics android 滚动行为 
         * 4.AlwaysScrollableScrollPhysics / ScrollPhysics 默认平台滚动
         */
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Container(
            height: 150,
            color: Colors.red,
          ),
          Container(
            height: 150,
            color: Colors.yellow,
          ),
          Container(
            height: 150,
            color: Colors.blue,
          ),
          Container(
            height: 150,
            color: Colors.green,
          ),
          Container(
            height: 150,
            color: Colors.red,
          ),
          Container(
            height: 150,
            color: Colors.yellow,
          ),
          Container(
            height: 150,
            color: Colors.blue,
          ),
          Container(
            height: 150,
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}
