import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_fultter/widget/scaffold/school.dart';
import 'package:test_fultter/widget/scaffold/shop.dart';

import 'business.dart';
import 'home.dart';

class ScaffoldPage2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScaffoldState2();
  }
}

class ScaffoldState2 extends State<ScaffoldPage2> {
  List<Widget> _widgets = [Home(), Business(), School(), Shop()];
  List<Color> _colors = [Colors.black, Colors.grey, Colors.grey, Colors.grey];
  int _selectIndex = 0;
  Widget _currentWidget;

  initState() {
    _currentWidget = _widgets[0];
    super.initState();
  }

  _onItemSelect(int index) {
    setState(() {
      _selectIndex = index;
      _currentWidget = _widgets[index];
      _onItemSelectColor(index);
    });
  }

  _onItemSelectColor(int index) {
    for (int i = 0; i < _colors.length; ++i) {
      if (i == index) {
        _colors[i] = Colors.black;
      } else {
        _colors[i] = Colors.grey;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ScaffoldPage 2'),
      ),
      body: _currentWidget,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(), //底部导航栏打洞
        child: Row(
          children: <Widget>[
            IconButton(
              color: _colors[0],
              icon: Icon(Icons.home),
              onPressed: () {
                _onItemSelect(0);
              },
            ),
            IconButton(
              color: _colors[1],
              icon: Icon(Icons.business),
              onPressed: () {
                _onItemSelect(1);
              },
            ),
            SizedBox(), //中间位置空出
            IconButton(
              color: _colors[2],
              icon: Icon(Icons.school),
              onPressed: () {
                _onItemSelect(2);
              },
            ),
            IconButton(
              color: _colors[3],
              icon: Icon(Icons.shop),
              onPressed: () {
                _onItemSelect(3);
              },
            )
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround, //均分底部导航栏横向空间
        ),

        // currentIndex: _selectIndex,
        // onTap: _onItemSelect,
        // fixedColor: Colors.blue,
        // activeColor: Colors.red,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          //悬浮按钮
          child: Icon(Icons.add),
          onPressed: () {}),
    );
  }
}
