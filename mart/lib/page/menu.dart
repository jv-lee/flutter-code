import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mart/cache.dart';
import 'package:mart/const/constants.dart';
import 'package:mart/model/userInfo.dart';
import 'package:mart/tool/commonTool.dart';
import 'package:mart/tool/eventModel.dart';
import 'package:mart/tool/eventbus.dart';
import 'package:mart/widget/rippleLayout.dart';

class MenuPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MenuState();
  }
}

class MenuState extends State<MenuPage> {
  static const _editText = 'Edit Profile';
  static const _logoutText = 'LOGOUT';
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
  UserInfo userInfo = Cache.userinfo;

  @override
  void initState() {
    super.initState();
    //绑定用户信息通知
    // bus.on(Constants.EVENT_USER_INFO, (arg) {
    //   var userinfo = (arg as EventModel<UserInfo>).data;
    //   if (userinfo != null) {
    //     userAvatar = Image.asset(CommonTool.selectAvatar(userinfo.avatarId));
    //     userName = userinfo.userName;
    //     userPhone = userinfo.userPhone;
    //     isLogin = userinfo.isLogin;
    //   }
    //   setState(() {});
    // });
  }

  @override
  void dispose() {
    super.dispose();
    //反注册用户信息通知
    bus.off(Constants.EVENT_USER_INFO);
    userInfo = null;
  }

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
        // 头像
        Positioned(
          top: 24,
          left: 39,
          child: Image.asset(CommonTool.selectAvatar(userInfo.avatarId)),
        ),
        // Edit Profile Button
        Positioned(
          top: 27,
          right: 34.5,
          child: Container(
            padding: EdgeInsets.all(1),
            width: 82.5,
            height: 27,
            child: RippleLayout(
              btnColor: Color(0xFF303030),
              child: Text(
                _editText,
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
              tapCallback: () => startMenuRouter(4),
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
          ),
        ),
        // 用户名
        Positioned(
          left: 37,
          bottom: 44,
          child: Text(
            userInfo.userName,
            style: TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        // 电话号码
        Positioned(
          left: 37,
          bottom: 25,
          child: Text(
            userInfo.userPhone,
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
          // LOGOUT 退出登陆
          Positioned(
            bottom: 29,
            child: Container(
              child: RippleLayout(
                width: 263.5,
                height: 45,
                child: Text(
                  _logoutText,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                tapCallback: () => startMenuRouter(5),
                radius: 10,
                btnColor: Colors.red,
                touchColor: Colors.black12,
              ),
            ),
          )
        ],
      ),
    );
  }
}
