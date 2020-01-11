import 'package:flutter/material.dart';
import 'package:test_fultter/simple_flex.dart';
import 'package:test_fultter/simple_flow.dart';
import 'package:test_fultter/simple_gridview.dart';
import 'package:test_fultter/simple_list.dart';
import 'package:test_fultter/simple_list_builder.dart';
import 'package:test_fultter/simple_list_separated.dart';
import 'package:test_fultter/simple_list_word.dart';
import 'package:test_fultter/simple_stack.dart';
import 'package:test_fultter/simple_wrap.dart';
import 'package:test_fultter/widget_test.dart';

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
      home: SimpleGirdViewBuilder(),
    );
  }
}
