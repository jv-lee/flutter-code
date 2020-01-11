import 'package:flutter/material.dart';
import 'package:test_fultter/column_test.dart';
import 'package:test_fultter/new_page.dart';
import 'package:test_fultter/row_test.dart';
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
      home: SimpleColumn(),
    );
  }
}
