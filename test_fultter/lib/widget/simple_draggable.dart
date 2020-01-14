import 'package:flutter/material.dart';

class SimpleDraggable extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SimpleDraggableState();
  }
}

class SimpleDraggableState extends State<SimpleDraggable> {
  double width = 100;
  double height = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Draggable(
          data: Colors.red,
          child: Container(
            width: width,
            height: height,
            color: Colors.yellow,
          ),
          feedback: Container(
            width: width,
            height: height,
            color: Colors.orange,
          ),
          onDraggableCanceled: (Velocity velocity, Offset offset) {
            setState(() {
              width += offset.dx;
              height += offset.dy;
            });
          },
        ),
      ),
    );
  }
}
