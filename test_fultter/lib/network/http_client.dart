import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_fultter/network/const.dart';

class HttpClientPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HttpClientPageState();
  }
}

class HttpClientPageState extends State<HttpClientPage> {
  Future<String> _fetch() async {
    var client = HttpClient();
    var uri = Uri.parse(Constants.todosURL);

    var request = await client.getUrl(uri);
    var response = await request.close();
    return response.statusCode == HttpStatus.OK
        ? response.transform(Utf8Decoder()).join()
        : throw Exception("Failed to fetch data");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Http Client Page'),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: Container(
              child: FutureBuilder(
                future: _fetch(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data);
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
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
