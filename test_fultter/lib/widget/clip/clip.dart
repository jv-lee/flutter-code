import 'package:flutter/material.dart';

class ClipPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clip Page'),
        textTheme: TextTheme(),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ClipOval(
              child: Container(
                width: 50,
                height: 50,
                color: Colors.blue,
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Container(
                width: 50,
                height: 50,
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
