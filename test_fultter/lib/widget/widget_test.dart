import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/**
 * 基础控件
 */
class WidgetTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WidgetPage();
  }
}

class WidgetPage extends State<WidgetTest> {
  TextEditingController _controller;
  var image =
      'https://pics4.baidu.com/feed/b64543a98226cffc649ab7e0f89c4296f703ea57.jpeg?token=da765ac8ae17be76501a9c1b2d0bf7f8&s=21A0D85F46B9F07D42A4988603003091';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: 'input phone');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WidgetTest'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text 文本
            Text(
              'you have pushed the button this many times.you have pushed the button this many times.you have pushed the button this many times.',
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  backgroundColor: Colors.red),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            // 多样式文本 类似于 link: www.baidu.com 只可点击网页
            Text.rich(TextSpan(children: [
              TextSpan(text: "LInk："),
              TextSpan(
                  text: "www.163.com", style: TextStyle(color: Colors.blue))
            ])),
            // 输入框
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                  hintText: "please input phone", border: OutlineInputBorder()),
              inputFormatters: [
                WhitelistingTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(11)
              ],
            ),
            // 图片
            Image(
              image: AssetImage('assets/images/ic_launcher.png'),
              width: 50,
              height: 50,
            ),
            Image.asset('assets/images/ic_launcher.png', width: 50, height: 50),
            Image(
              image: NetworkImage(image),
              width: 50,
              height: 50,
            ),
            // 圆角图片
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                image,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            // 圆形头像
            CircleAvatar(
              radius: 10,
              backgroundImage: NetworkImage(image),
            ),
            // 圆形图片
            ClipOval(
                child: Image.network(
              image,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            )),
            ClipRect(
              child: Image.network(
                image,
                width: 50,
                height: 50,
              ),
            ),
            // 通过容器实现圆形图
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(image), fit: BoxFit.cover),
                  shape: BoxShape.circle),
            ),
            //通过容器实现圆角图
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(image), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10)),
            ),
            Icon(
              Icons.face,
              color: Colors.blue,
              size: 10,
            ),
            Icon(
              IconData(0xe617, fontFamily: 'iconfont'),
              size: 30,
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
