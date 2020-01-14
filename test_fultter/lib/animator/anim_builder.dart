import 'package:flutter/material.dart';

class AnimBuilder extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AnimBuilderState();
  }
}

class AnimBuilderState extends State<AnimBuilder>
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
    return AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Center(
            child: SizedBox(
              width: _animation.value,
              height: _animation.value,
              child: Container(
                color: Colors.blue,
              ),
            ),
          );
        });
  }
}
