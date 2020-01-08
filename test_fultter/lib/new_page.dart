import 'package:flutter/material.dart';

class NewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NewPageState();
  }
}

class NewPageState extends State<NewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(16, 120, 16, 0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: logo() + createBtn()),
      ),
    );
  }
}

List<Widget> logo() {
  return <Widget>[
    Image(
      image: AssetImage('assets/images/ic_logo.png'),
      width: 100,
      height: 102,
      fit: BoxFit.fitHeight,
    ),
    SizedBox(
      height: 10,
      width: 10,
    ),
    Text(
      'welcome',
      style: TextStyle(
          color: Color(0XFF333333),
          fontSize: 20,
          decoration: TextDecoration.none),
    )
  ];
}

List<Widget> createBtn() {
  return <Widget>[
    SizedBox(
      height: 118,
    ),
    Material(
        child: RaisedButton(
      color: Colors.blue,
      disabledColor: Colors.blue,
      padding: EdgeInsets.symmetric(vertical: 13),
      child: Text(
        '第一个按钮',
        style: TextStyle(color: Colors.white, fontSize: 16),
        textAlign: TextAlign.center,
      ),
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.all(Radius.circular(2))),
    ))
  ];
}
