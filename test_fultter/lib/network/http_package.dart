import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'const.dart';

class HttpPackagePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HttpPackageState();
  }
}

class HttpPackageState extends State<HttpPackagePage> {
  Future<String> _fetch() async {
    var response = await get(Constants.todosURL);
    return response.statusCode == HttpStatus.ok
        ? response.body.toString()
        : throw Exception('request http error');
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
