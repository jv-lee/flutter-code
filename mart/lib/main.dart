import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mart/routes/splash.dart';

void main() {
  runApp(MyApp());

  //状态栏透明
  if (Platform.isAndroid) {
    var style = SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark);
    SystemChrome.setSystemUIOverlayStyle(style);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          // textTheme: TextTheme(title: TextStyle(color: Colors.red)),
          primaryTextTheme:
              TextTheme(title: TextStyle(color: Colors.blue)), //修改appbar 文字颜色
          primaryIconTheme: const IconThemeData.fallback()
              .copyWith(color: Colors.blue), //修改appbar 图标颜色
          accentColor: Colors.blue, //Color类型，前景色（文本、按钮等）
          canvasColor:
              Colors.white, //Color类型，MaterialType.canvas Material的默认颜色。
          backgroundColor:
              Colors.blue, //Color类型，与primaryColor对比的颜色(例如 用作进度条的剩余部分)。
          primaryColor: Colors.white, //Color类型，App主要部分的背景色（ToolBar,Tabbar等）。
          scaffoldBackgroundColor: Colors.white,
          pageTransitionsTheme: PageTransitionsTheme(
              builders: <TargetPlatform, PageTransitionsBuilder>{
                TargetPlatform.android: CupertinoPageTransitionsBuilder(),
                TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
                TargetPlatform.fuchsia: CupertinoPageTransitionsBuilder()
              })),
      home: SplashRoute(),

      // 与home不能同时存在
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => FirstRoute(),
      //   '/secondRoute': (context) => SecondRoute(),
      // },
    );
  }
}
