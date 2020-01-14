import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

/**
 * 异步加载数据列表 demo
 */
class SimpleListWord extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SimpleListWordWidget();
  }
}

class SimpleListWordWidget extends State<SimpleListWord> {
  List<String> _wrods = <String>[''];

  void _loadWords() {
    Future.delayed(Duration(milliseconds: 1000)).then((e) {
      _wrods.insertAll(_wrods.length - 1,
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    _loadWords();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('simple list word'),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          if (index == _wrods.length - 1) {
            if (_wrods.length < 100) {
              _loadWords();
              return Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              );
            } else {
              return Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.center,
                child: Text('没有更多了'),
              );
            }
          }

          return ListTile(
            title: Text(_wrods[index]),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(height: 2.0, color: Colors.black, thickness: 2.0);
        },
        itemCount: _wrods.length,
      ),
    );
  }
}
