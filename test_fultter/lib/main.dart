import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_fultter/animator/anim_builder.dart';
import 'package:test_fultter/animator/anim_widget.dart';
import 'package:test_fultter/animator/basic_anim.dart';
import 'package:test_fultter/animator/scale_anim.dart';
import 'package:test_fultter/animator/sync_anim.dart';
import 'package:test_fultter/router/simple_router.dart';

void main() => runApp(MyApp());

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
      // theme: ThemeData(primarySwatch: Colors.blue),
      // home: NewPage(),
      // home: WidgetTest(),
      // home: SimpleRow(),
      // home: SimpleColumn(),
      // home: SimpleFlex(),
      // home: SimpleStack(),
      // home: SimpleWrap(),
      // home: SimpleFlow(),
      // home: SimpleList(),
      // home: SimpleListBuilder(),
      // home: SimpleListSeparated(),
      // home: SimpleListWord(),
      // home: SimpleGirdViewBuilder(),
      // home: FirstRoute(),

      // 与home不能同时存在
      initialRoute: '/',
      routes: {
        '/': (context) => FirstRoute(),
        '/secondRoute': (context) => SecondRoute(),
        '/basic_anim': (context) => BasicAnim(),
        '/simple_anim': (context) => SimpleAnimation(),
        '/anim_builder': (context) => AnimBuilder(),
        '/simple_scale_anim': (context) => SimpleScaleAnim(),
        '/sync_anim': (context) => SyncAnim(),
      },
    );
  }
}
