import 'package:flutter/material.dart';

class PointEvent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Point Event Page'),
        ),
        body: pointTest3());
  }
}

/**
 * 普通点击事件测试
 */
Widget pointTest1() {
  return Listener(
    child: Container(
      width: 300,
      height: 300,
      alignment: Alignment.center,
      // color: Colors.greenAccent,
      child: Center(
        child: Text('命中的测试'),
      ),
    ),
    onPointerDown: (event) {
      print(event.toString());
    },
    onPointerMove: (event) {
      print(event.toString());
    },
    onPointerUp: (event) {
      print(event.toString());
    },
    //设置为全容器可接受点击事件
    behavior: HitTestBehavior.opaque,
  );
}

/**
 * 层级点击事件测试
 */
Widget pointTest2() {
  return Stack(
    children: <Widget>[
      Listener(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.blue,
        ),
        onPointerDown: (event) {
          print('down');
        },
      ),
      Listener(
        child: Container(
          width: 300,
          height: 300,
          child: Center(
            child: Text('命中测试'),
          ),
        ),
        onPointerDown: (event) {
          print('up');
        },
        //穿透点击 层叠布局同时触发事件
        behavior: HitTestBehavior.translucent,
      ),
    ],
  );
}

/**
 * 事件拦截
 */
Widget pointTest3() {
  return Listener(
    //IgnorePointer 全部忽略
    //AbsorbPointer 忽略内部
    child: AbsorbPointer(
      child: Listener(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.blue,
        ),
        onPointerDown: (event) {
          print('inner');
        },
      ),
    ),
    onPointerDown: (event) {
      print('outer');
    },
  );
}
