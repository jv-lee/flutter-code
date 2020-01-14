import 'package:flutter/material.dart';

class SyncAnim extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SyncState();
  }
}

class SyncState extends State<SyncAnim> with SingleTickerProviderStateMixin {
  Animation _animation;
  AnimationController _controller;
  Tween<double> _tween;
  Tween<double> _opacity;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    _tween = Tween(begin: 0, end: 300);
    _opacity = Tween(begin: 0, end: 0.5);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Center(
          child: Opacity(
            opacity: _opacity.evaluate(_animation),
            child: SizedBox(
              width: _tween.evaluate(_animation),
              height: _tween.evaluate(_animation),
              child: Container(
                color: Colors.blue,
              ),
            ),
          ),
        );
      },
    );
  }
}
