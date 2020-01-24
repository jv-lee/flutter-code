import 'package:flutter/material.dart';

class ShareDataWidget extends InheritedWidget {
  ShareDataWidget({@required this.data, Widget child}) : super(child: child);
  final int data; //需要在子树中共享的数据，保存点击次数

  //定义一个便捷方法，方便子树中的widget获取共享数据
  static ShareDataWidget of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(ShareDataWidget);
  }

  //该回调决定当data发生变化时，是否通知子树中依赖data的widget
  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    //返回true，则子树中的依赖（build函数中有回调）本widget的widget的`state.didChangeDependencies`会被调用
    return oldWidget.data != data;
  }
}

class _TestShareWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TestShareState();
  }
}

class _TestShareState extends State<_TestShareWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(ShareDataWidget.of(context).data.toString());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('Dependencies change');
  }
}
