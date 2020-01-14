import 'package:flutter/material.dart';

class BasicAnim extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BasicState();
  }
}

class BasicState extends State<BasicAnim> with SingleTickerProviderStateMixin {
  Animation _animation;
  AnimationController _controller;
  Tween<double> _tween;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    _tween = Tween(begin: 0, end: 300);
    // _animation = _tween.animate(_controller)
    _animation = _tween.animate(
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn))
      ..addListener(() {
        setState(() {});
      });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: SizedBox(
          width: _animation.value,
          height: _animation.value,
          child: Container(
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
