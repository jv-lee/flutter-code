import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MenuPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MenuState();
  }
}

class MenuState extends State<MenuPage> {
  var iconList = {
    Image.asset('assets/images/ic_menu_update_password.png'),
    Image.asset('assets/images/ic_menu_about_us.png'),
    Image.asset('assets/images/ic_menu_contact_us.png'),
    Image.asset('assets/images/ic_menu_update_version.png'),
  };
  var textList = {
    'Ubah kata sandi login',
    'Tentang kami',
    'Hubungi kami',
    'Aplikasi update',
  };

  startMenuRouter(int index) {
    Fluttertoast.showToast(msg: 'click index $index');
    //可以关闭menu菜单
    Navigator.pop(context);
  }

  List buildMenu() {
    var list = List();
    for (var i = 0; i < iconList.length; i++) {
      list.add(GestureDetector(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              iconList.elementAt(i),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: Text(
                  textList.elementAt(i),
                  style: TextStyle(fontSize: 11),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
        onTap: () => startMenuRouter(i),
      ));
    }
    return list;
  }

  Widget buildHeader() {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 24,
          left: 39,
          child: Image.asset('assets/images/avatar01.png'),
        ),
        Positioned(
          top: 27,
          right: 34.5,
          child: Container(
            alignment: Alignment.center,
            width: 82.5,
            height: 27,
            child: Text(
              'Edit Profile',
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
          ),
        ),
        Positioned(
          left: 37,
          bottom: 44,
          child: Text(
            'User Name',
            style: TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        Positioned(
          left: 37,
          bottom: 25,
          child: Text(
            '+62 82195666615',
            style: TextStyle(fontSize: 13, color: Colors.white),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 284.9,
      color: Color(0xfff7f7f7),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // header layout
          Positioned(
            top: 0,
            child: Container(
              padding: EdgeInsets.only(top: 30),
              width: 284.9,
              height: 169.7,
              color: Color(0xFF303030),
              child: buildHeader(),
            ),
          ),

          // menu button
          Positioned(
            top: 170,
            child: Container(
                width: 284.9,
                height: 248,
                child: GridView(
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                    children: <Widget>[
                      ...?buildMenu(),
                    ],
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        maxCrossAxisExtent: 127,
                        childAspectRatio: 1.2))),
          ),
          Positioned(
            bottom: 10,
            child: Text('LOGOUT'),
          )
        ],
      ),
    );
  }
}
