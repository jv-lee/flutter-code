import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('First Route'),
        ),
        body: Flex(
          direction: Axis.vertical,
          children: <Widget>[
            Flex(
              mainAxisSize: MainAxisSize.min,
              direction: Axis.horizontal,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: RaisedButton(
                    child: Text('route 1'),
                    onPressed: () async {
                      //方式1
                      Navigator.pushNamed(context, '/secondRoute');
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: RaisedButton(
                      child: Text('route 2'),
                      onPressed: () async {
                        //方式2
                        var result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SecondRoute(
                                      arg: 'from first route',
                                    )));

                        if (result != null) {
                          Fluttertoast.showToast(
                              msg: result,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIos: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.black);
                        }
                      }),
                ),
                Expanded(
                  flex: 1,
                  child: RaisedButton(
                      child: Text('route 3'),
                      onPressed: () async {
                        //方式3
                        var result = await Navigator.pushNamed(
                            context, "/secondRoute",
                            arguments: 'Arg from first route');

                        if (result != null) {
                          Fluttertoast.showToast(
                              msg: result,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIos: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.black);
                        }
                      }),
                ),
                Expanded(
                  flex: 1,
                  child: RaisedButton(
                      child: Text('route 4'),
                      onPressed: () async {
                        // 方式4 使用动画路由设置
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                transitionDuration: Duration(milliseconds: 800),
                                pageBuilder: (BuildContext context,
                                    Animation<double> animation,
                                    Animation<double> secondaryAnimation) {
                                  return FadeTransition(
                                    opacity: animation,
                                    child: SecondRoute(),
                                  );
                                }));
                      }),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text('basic_anim'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/basic_anim');
                  },
                ),
                RaisedButton(
                  child: Text('simple_anim'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/simple_anim');
                  },
                ),
                RaisedButton(
                  child: Text('anim_builder'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/anim_builder');
                  },
                ),
                RaisedButton(
                  child: Text('simple_scale_anim'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/simple_scale_anim');
                  },
                ),
              ],
            )
          ],
        ));
  }
}

class SecondRoute extends StatelessWidget {
  final String arg;
  SecondRoute({this.arg});

  @override
  Widget build(BuildContext context) {
    final String arguments = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text('Second Route'),
        ),
        body: Column(
          children: <Widget>[
            Text(arg ?? arguments ?? ""),
            Center(
              child: RaisedButton(
                child: Text('Go back'),
                onPressed: () {
                  Navigator.pop(context, 'result from scondRoute');
                },
              ),
            ),
          ],
        ));
  }
}
