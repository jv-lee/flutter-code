import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GestureEvent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GestureState();
  }
}

class GestureState extends State<GestureEvent> {
  TapGestureRecognizer recognizer = TapGestureRecognizer();

  @override
  void dispose() {
    recognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gesture Event Page'),
      ),
      body: gestureTest3(context),
    );
  }

/**
 * 简单测试事件
 */
  Widget gestureTest1(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: Colors.blue,
        width: 300,
        height: 300,
      ),
      onTap: () => Fluttertoast.showToast(msg: 'onTap'),
      onDoubleTap: () => Fluttertoast.showToast(msg: 'onDoubleTap'),
      onLongPress: () => Fluttertoast.showToast(msg: 'onLongPress'),
    );
  }

  double _top = 10;
  double _left = 10;

  Widget gestureTest2(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: _top,
          left: _left,
          child: GestureDetector(
            child: Image.asset(
              'assets/images/ic_launcher.png',
              width: 50,
              height: 50,
            ),
            //实现拖动
            onPanUpdate: (details) {
              setState(() {
                _top += details.delta.dy;
                _left += details.delta.dx;
              });
            },
            onPanEnd: (details) {
              setState(() {
                print(
                    'child ${_top + 50} ${context.size.height - kBottomNavigationBarHeight}');
                if (_top < 0) _top = 0;
                if (_left < 0) _left = 0;
                if ((_top + 50) >
                    (context.size.height - kBottomNavigationBarHeight - 50))
                  _top = context.size.height - kBottomNavigationBarHeight - 96;
                if ((_left + 50) > context.size.width)
                  _left = context.size.width - 50;
              });
            },
            //只可以垂直拖动
            // onVerticalDragUpdate: (details) {
            //   _top += details.delta.dy;
            //   setState(() {});
            // },
            //实现缩放
            // onScaleUpdate: (details) {
            //   _top = 50 * details.scale;
            //   _left = 50 * details.scale;
            //   setState(() {});
            // },
          ),
        )
      ],
    );
  }

  Widget gestureTest3(BuildContext context) {
    return Center(
      child: Text.rich(TextSpan(children: [
        TextSpan(text: 'link:'),
        TextSpan(
            text: 'www.163.com',
            style: TextStyle(color: Colors.blue),
            recognizer: recognizer
              ..onTap = () {
                Fluttertoast.showToast(msg: 'click');
              })
      ])),
    );
  }
}
