import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WebSocketState();
  }
}

class WebSocketState extends State<WebSocketPage> {
  WebSocketChannel _channel;
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _channel = IOWebSocketChannel.connect('ws://echo.websocket.org');
    // _channel.stream.listen((message) {
    //   print('Receiver : $message');
    // });
  }

  _sendMessage() {
    if (_controller.text.isNotEmpty) {
      _channel.sink.add(_controller.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('WebSocketPage'),
        ),
        body: Padding(
          padding: EdgeInsets.all(60),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _controller,
              ),
              // 通过streambuilder 监听流数据
              StreamBuilder(
                stream: _channel.stream,
                builder: (context, snaphot) {
                  return Text(snaphot.hasData ? '${snaphot.data}' : '');
                },
              ),
              RaisedButton(
                child: Text('send message'),
                onPressed: () {
                  _sendMessage();
                },
              ),
            ],
          ),
        ));
  }

  @override
  void dispose() {
    _channel.sink.close();
    super.dispose();
  }
}
