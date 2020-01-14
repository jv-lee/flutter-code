import 'package:flutter/material.dart';

class ScaleAnim extends StatelessWidget {
  final Animation<double> animation;

  final Widget child;

  ScaleAnim({@required this.animation, @required this.child});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return SizedBox(
          width: animation.value,
          height: animation.value,
          child: child,
        );
      },
      child: child,
    );
  }
}

class SimpleScaleAnim extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SimpleScaleAnimState();
  }
}

class SimpleScaleAnimState extends State<SimpleScaleAnim>
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
    // _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('anim'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            MaterialButton(
              child: Text('click'),
              onPressed: () {
                _controller.forward();
              },
            ),
            ScaleTransition(
                scale: _controller,
                child: Container(
                  color: Colors.blue,
                )),
            ScaleAnim(
                animation: _animation,
                child: Container(
                  color: Colors.blue,
                )),
          ],
        ),
      ),
    );
  }
}
