import 'package:flutter/material.dart';

class SimpleAnimation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AnimState();
  }
}

class AnimState extends State<SimpleAnimation>
    with SingleTickerProviderStateMixin {
  Animation _animation;
  AnimationController _controller;
  Tween<double> _tween;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    _tween = Tween(begin: 0, end: 300);
    _animation = _tween.animate(
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimWidget(
      animation: _animation,
    );
  }
}

class AnimWidget extends AnimatedWidget {
  AnimWidget({Animation animation}) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    Animation<double> animation = listenable;
    return Center(
      child: SizedBox(
        width: animation.value,
        height: animation.value,
        child: Container(
          color: Colors.blue,
        ),
      ),
    );
  }
}
