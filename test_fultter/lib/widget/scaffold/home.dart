import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController = PageController(initialPage: 0);
  List tabs = ["新闻", "历史", "图片"];
  //控制单项选择page / tab/page 分离控制
  var isPageMove = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(() {
      if (isPageMove) {
        _tabController.animateTo(_tabController.index);
        isPageMove = false;
      } else {
        _pageController.jumpToPage(_tabController.index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.blue,
          height: 38,
          child: TabBar(
            controller: _tabController,
            tabs: tabs
                .map((e) => Tab(
                      text: e,
                    ))
                .toList(),
            indicatorColor: Colors.red,
            labelColor: Colors.red,
            unselectedLabelColor: Colors.black,
          ),
        ),
        Expanded(
          child: PageView.builder(
            itemCount: tabs.length,
            controller: _pageController,
            itemBuilder: (context, index) {
              return Text(tabs[index]);
            },
            onPageChanged: (index) {
              isPageMove = true;
              _tabController.animateTo(index);
            },
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
}
