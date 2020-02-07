import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mart/routes/home.dart';

class SplashRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashState();
  }
}

class SplashState extends State<SplashRoute> {
  timeOutPage() {
    Timer(Duration(seconds: 3), () {
      startHomePage();
    });
  }

  startHomePage() {
    Navigator.pushAndRemoveUntil(
        context,
        CupertinoPageRoute(builder: (context) => HomeRoute()),
        (Route<dynamic> rout) => false);
  }

  @override
  void initState() {
    super.initState();
    timeOutPage();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            Positioned(
              top: 160,
              child: Image.asset('assets/images/ic_splash_info.png'),
            ),
            Positioned(
              bottom: 90,
              child: Image.asset('assets/images/ic_splash_logo.png'),
            )
          ],
        ),
      ),
    );
  }
}
