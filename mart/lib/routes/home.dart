import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mart/page/complete.dart';
import 'package:mart/page/menu.dart';
import 'package:mart/page/recommend.dart';

class HomeRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<HomeRoute> {
  List<Widget> _widgets = [
    RecommendPage(),
    CompletePage(),
  ];
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
      drawer: MenuPage(),
      body: _currentWidget,
      bottomNavigationBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), title: Text('Recommend')),
          BottomNavigationBarItem(
              icon: Icon(Icons.compare), title: Text('Complete')),
        ],
        currentIndex: _selectIndex,
        onTap: _onItemSelect,
        activeColor: Colors.red,
        inactiveColor: Colors.grey,
      ),
    );
  }
}
