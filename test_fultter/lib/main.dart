import 'package:flutter/material.dart';
import 'package:test_fultter/animator/anim_builder.dart';
import 'package:test_fultter/animator/anim_widget.dart';
import 'package:test_fultter/animator/basic_anim.dart';
import 'package:test_fultter/animator/scale_anim.dart';
import 'package:test_fultter/router/simple_router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
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
      },
    );
  }
}
