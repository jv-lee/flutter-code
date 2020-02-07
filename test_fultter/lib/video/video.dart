import 'package:flutter/material.dart';

class VideoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return VideoState();
  }
}

class VideoState extends State<VideoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VideoPage'),
      ),
      body: Center(
        child: Container(
          child: Text('data'),
        ),
      ),
    );
  }
}
