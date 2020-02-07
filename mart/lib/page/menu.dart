import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MenuState();
  }
}

class MenuState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 284.9,
      color: Color(0xfff7f7f7),
      child: Column(
        children: <Widget>[
          Container(
            width: 284.9,
            height: 139.7,
            color: Color(0xFF303030),
          ),
          Container(
            width: 284.9,
            height: 99,
            margin: EdgeInsets.only(top: 20, left: 10, right: 10),
            child: Stack(
              children: <Widget>[
                Positioned(
                  child: Container(
                    width: 127,
                    height: 99,
                    color: Colors.white,
                  ),
                  left: 0,
                ),
                Positioned(
                  child: Container(
                    width: 127,
                    height: 99,
                    color: Colors.white,
                  ),
                  right: 0,
                ),
              ],
            ),
          ),
          Container(
            width: 284.9,
            height: 99,
            margin: EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Stack(
              children: <Widget>[
                Positioned(
                  child: Container(
                    width: 127,
                    height: 99,
                    color: Colors.white,
                  ),
                  left: 0,
                ),
                Positioned(
                  child: Container(
                    width: 127,
                    height: 99,
                    color: Colors.white,
                  ),
                  right: 0,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
