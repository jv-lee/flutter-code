import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'const.dart';

class DioPackagePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DioPackageState();
  }
}

class DioPackageState extends State<DioPackagePage> {
  Future<String> _fetch() async {
    var dio = Dio();
    var response = await dio.get(Constants.todosURL);
    return response.statusCode == HttpStatus.ok
        ? response.data.toString()
        : throw Exception('request http code');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('HttpPackagePage'),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: Container(
              child: FutureBuilder(
                future: _fetch(),
                builder: (context, response) {
                  if (response.hasData) {
                    return Text(response.data);
                  } else if (response.hasError) {
                    return Text("${response.error}");
                  }
                  return CircularProgressIndicator(
                    backgroundColor: Colors.blue,
                  );
                },
              ),
            ),
          ),
        ));
  }
}
