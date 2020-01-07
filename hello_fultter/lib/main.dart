import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //此小部件是应用程序的根。
  @override
  Widget build(BuildContext context) {
    var materialApp = MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //这是您的应用程序的主题。
        //
        //尝试使用“ flutter run”运行您的应用程序。 您会看到
        //应用程序有一个蓝色的工具栏。 然后，不退出应用程序，尝试
        //将下面的primarySwatch更改为Colors.green，然后调用
        //“热重载”（在运行“ flutter run”的控制台中按“ r”，
        //或只是将更改保存到Flutter IDE中的“热重载”中。
        //请注意，计数器并未重置为零； 应用程序
        //不会重新启动。
        primarySwatch: Colors.blue,
      ),
      routes: {
        "new_page": (context) => NewRoute(),
        "tip_page": (context) => TipRoute(
              //直接获取传递的参数 为text
              text: ModalRoute.of(context).settings.arguments,
            ),
        // "/":(context)=>MyHomePage(title: "Flutter Demo Home Page",),//注册首页路由信息
      },
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) {
          String routeName = settings.name;
          //当前位置可以拦截未在路由表注册的路由执行前的操作 如：访问的路由需要登陆状态，当前为未登陆状态，则直接返回登陆路由
          //引导用户登陆，其他情况则正常打开路由
          print("当前打开的路由：$routeName");
        });
      },
      //navigatorObservers:监听所有路由跳转动作
      //onUnknownRoute:在打开一个不存在的命名路由时会被调用
    );
    return materialApp;
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // 此小部件是您的应用程序的主页。 它是有状态的，意思是
  // 它有一个State对象（定义如下），其中包含影响看起来如何。

  // 此类是状态的配置。 它保存值（在此父（在此情况下为App小部件）提供的标题）
  // 由国家的建造方法使用。 Widget子类中的字段是始终标记为“最终”。
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // 对setState的此调用告诉Flutter框架
      // 在此状态下发生更改，导致它重新运行以下构建方法
      // 以便显示可以反映更新的值。 如果我们改变了
      // _counter而不调用setState（），则build方法不会
      // 再次调用，因此似乎什么也没有发生。
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 每次调用setState时都会重新运行此方法，例如完成
    // 通过上面的_incrementCounter方法。

    // Flutter框架已经过优化，可以重新运行构建方法快速，因此您可以重建任何需要更新的内容
    // 而不是必须单独更改小部件的实例。
    return Scaffold(
      appBar: AppBar(
        // 在这里，我们从MyHomePage对象创建的值中
        // App.build方法，并使用它来设置我们的应用栏标题。
        title: Text(widget.title),
      ),
      body: Center(
        // Center是一个布局小部件。 它需要一个孩子并放置它在父母中间。
        child: Column(
          // 列也是布局小部件。 它需要一个孩子的清单和
          // 垂直排列它们。 默认情况下，它会自动调整大小以适合其子项水平放置，并尝试与父项一样高。
          //
          // 调用“调试绘画”（在控制台中按“ p”，选择Android Studio中Flutter Inspector的“切换调试画图”操作
          // 或Visual Studio Code中的“切换调试画图”命令）
          // 查看每个小部件的线框。
          //
          // 列具有各种属性，可控制其自身大小以及子元素的位置。
          // 在这里，我们使用mainAxisAlignment将子项垂直居中；
          // 这里的主轴是垂直轴，因为列是垂直的（交叉轴将是水平的）。
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            //打开一个简单的路由界面
            FlatButton(
              child: Text("open new route"),
              textColor: Colors.blue,
              onPressed: () {
                //导航到新的路由界面
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return NewRoute();
                }));
              },
            ),
            //通过路由名打开一个带返回值的路由界面
            FlatButton(
              child: Text("open resultRoute"),
              textColor: Colors.blue,
              onPressed: () async {
                var result = await Navigator.pushNamed(context, "tip_page",
                    arguments: 'hi,this is arguments');
                print("路由返回值：$result");
              },
            ),
            RandomWordsWidget(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // 该逗号结尾使自动格式化更适合构建方法。
    );
  }
}

///简单路由页面
class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Route Title"),
      ),
      body: Center(
        child: Text("This is new route page"),
      ),
    );
  }
}

/// 传递参数路由界面
class TipRoute extends StatelessWidget {
  TipRoute({
    Key key,
    @required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments;
    print("这是主页面传递过来的参数:$args");
    return Scaffold(
      appBar: AppBar(
        title: Text("提示"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              RaisedButton(
                onPressed: () => Navigator.pop(context, "我是返回值"),
                child: Text("返回"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RandomWordsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var data = DefaultAssetBundle.of(context).loadString('assets/data.json');
    var data = rootBundle.loadString('assets/data.json');
    print("data:");
    //生成随机字符串
    final wordPair = new WordPair.random();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Text(wordPair.toString()),
    );
  }
}
