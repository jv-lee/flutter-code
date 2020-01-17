import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:test_fultter/model/photo.dart';
import 'const.dart';

class JsonTestPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return JsonTestState();
  }
}

class JsonTestState extends State<JsonTestPage> {
  // Future<List<String>> _fetchPhotos() async {
  //   var response = await http.get(Constants.photosURL);
  //   if (response.statusCode == HttpStatus.ok) {
  //     return parsePhotos(response.body);
  //   } else {
  //     throw Exception('Failed to fetch photos');
  //   }
  // }

  // List<String> parsePhotos(String responseBody) {
  //   List parsed = json.decode(responseBody);
  //   return parsed.map((json) {
  //     return json['thumbnailUrl'] as String;
  //   }).toList();
  // }

  Future<List<Photo>> _fetchPhotos() async {
    var response = await http.get(Constants.photosURL);
    if (response.statusCode == HttpStatus.ok) {
      return parsePhotos(response.body);
    } else {
      throw Exception('Failed to fetch photos');
    }
  }

  List<Photo> parsePhotos(String responseBody) {
    List parsed = json.decode(responseBody);
    return parsed.map((json) {
      return Photo.fromJson(json);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('JsonPage'),
        ),
        body: Center(
          child: FutureBuilder(
            future: _fetchPhotos(),
            builder: (context, response) {
              print('response -> ${response.hasData}');
              if (response.hasData) {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return Image.network(response.data[index].thumbnailUrl);
                  },
                );
              } else if (response.hasError) {
                return Text("${response.error}");
              }
              return CircularProgressIndicator(
                backgroundColor: Colors.blue,
              );
            },
          ),
        ));
  }
}
