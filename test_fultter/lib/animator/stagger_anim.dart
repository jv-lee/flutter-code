import 'package:flutter/material.dart';

class Stagger extends StatelessWidget {
  final AnimationController controller;
  final Animation<double> opacity, width, height;
  final Animation<EdgeInsets> padding;
  final Animation<BorderRadius> borderRadius;
  final Animation<Color> color;

  Stagger({Key key, this.controller})
      : opacity = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: controller,
            curve: Interval(0.0, 0.1000, curve: Curves.linear))),
        width = Tween(begin: 50.0, end: 150.0).animate(CurvedAnimation(
            parent: controller,
            curve: Interval(0.125, 0.250, curve: Curves.linear))),
        height = Tween(begin: 50.0, end: 150.0).animate(CurvedAnimation(
            parent: controller,
            curve: Interval(0.250, 0.375, curve: Curves.linear))),
        padding = EdgeInsetsTween(
                begin: EdgeInsets.only(bottom: 10),
                end: EdgeInsets.only(bottom: 50))
            .animate(CurvedAnimation(
                parent: controller,
                curve: Interval(0.250, 0.375, curve: Curves.linear))),
        borderRadius = BorderRadiusTween(
                begin: BorderRadius.circular(5), end: BorderRadius.circular(35))
            .animate(CurvedAnimation(
                parent: controller,
                curve: Interval(0.375, 0.500, curve: Curves.linear))),
        color = ColorTween(begin: Colors.blue, end: Colors.red).animate(
            CurvedAnimation(
                parent: controller,
                curve: Interval(0.500, 0.750, curve: Curves.linear))),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Container(
          padding: padding.value,
          alignment: Alignment.bottomCenter,
          child: Opacity(
            opacity: opacity.value,
            child: Container(
              width: width.value,
              height: height.value,
              decoration: BoxDecoration(
                  color: color.value,
                  border: Border.all(color: Colors.blue, width: 3),
                  borderRadius: borderRadius.value),
            ),
          ),
        );
      },
    );
  }
}

class StaggerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StaggerState();
  }
}

class StaggerState extends State<StaggerPage> with TickerProviderStateMixin {
  AnimationController _controller;

  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: Duration(
          seconds: 10,
        ),
        vsync: this);

    if (true) {
      return;
    }
    //监听状态自动执行
    _controller.addStatusListener((status) {
      switch (status) {
        case AnimationStatus.dismissed:
          _controller.forward();
          break;
        case AnimationStatus.completed:
          _controller.reverse();
          break;
        case AnimationStatus.forward:
        case AnimationStatus.reverse:
          break;
      }
    });
  }

  _play() async {
    await _controller.forward().orCancel;
    await _controller.reverse().orCancel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          _play();
        },
        child: Center(
          child: Container(
            color: Colors.greenAccent,
            width: 300,
            height: 300,
            child: Stagger(
              controller: _controller,
            ),
          ),
        ),
      ),
    );
  }
}
