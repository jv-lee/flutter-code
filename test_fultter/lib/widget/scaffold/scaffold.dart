import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_fultter/widget/scaffold/business.dart';
import 'package:test_fultter/widget/scaffold/school.dart';
import 'package:test_fultter/widget/scaffold/shop.dart';

import 'home.dart';

class ScaffoldPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScaffoldState();
  }
}

class ScaffoldState extends State<ScaffoldPage> {
  List<Widget> _widgets = [Home(), Business(), School(), Shop()];
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ScaffoldPage'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.share),
              onPressed: () => Fluttertoast.showToast(msg: 'clickShare'))
        ],
      ),
      body: _currentWidget,
      bottomNavigationBar: CupertinoTabBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), title: Text('Business')),
          BottomNavigationBarItem(
              icon: Icon(Icons.school), title: Text('School')),
          BottomNavigationBarItem(icon: Icon(Icons.shop), title: Text('Shop'))
        ],
        currentIndex: _selectIndex,
        onTap: _onItemSelect,
        // fixedColor: Colors.blue,
        activeColor: Colors.red,
        inactiveColor: Colors.grey,
      ),
    );
  }
}
