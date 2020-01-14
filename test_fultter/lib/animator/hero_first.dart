import 'package:flutter/material.dart';

class HeroFirst extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero First'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Text('this is hero first page.'),
            Text('show hero element animation.'),
            InkWell(
              child: Hero(
                tag: 'avatar',
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/ic_launcher.png',
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Scaffold(
                    appBar: AppBar(
                      title: Text('hero last'),
                    ),
                    body: Center(
                      child: Hero(
                        tag: 'avatar',
                        child: Image.asset('assets/images/ic_launcher.png'),
                      ),
                    ),
                  );
                }));
              },
            )
          ],
        ),
      ),
    );
  }
}
