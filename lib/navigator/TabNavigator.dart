import 'package:flutter/material.dart';
import 'package:flutter_trip/pages/HomePage.dart';
import 'package:flutter_trip/pages/MinePage.dart';
import 'package:flutter_trip/pages/SearchPage.dart';
import 'package:flutter_trip/pages/TravelPage.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  //选中界面脚标
  int _currentIndex = 0;

  //默认颜色
  final _defaultColor = Colors.grey;

  //选中颜色
  final _activeColor = Colors.blue;

  //TODO PageView的控制器
  final PageController _controller = PageController(initialPage: 0);
  List<String>list = new List();
  @override
  void initState() {
    super.initState();
    list.add("首页");
    list.add("搜索");
    list.add("旅拍");
    list.add("我的");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(list[_currentIndex]),
      ),
      //TODO PageView还没有使用过
      body: PageView(
        controller: _controller,
        children: <Widget>[
          //里面写要显示的widget
          HomePage(),
          SearchPage(),
          TravelPage(),
          MinePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          _bottomItem(0, "首页", Icons.home),
          _bottomItem(1, "搜索", Icons.search),
          _bottomItem(2, "旅拍", Icons.camera),
          _bottomItem(3, "我的", Icons.account_circle),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          _controller.jumpToPage(index);
        },
      ),
    );
  }

  _bottomItem(int index, String title, IconData icon) {
    return BottomNavigationBarItem(
        title: (Text(title,
            style: TextStyle(
                color: _currentIndex != index ? _defaultColor : _activeColor))),
        icon: Icon(icon, color: _defaultColor),
        activeIcon: Icon(icon, color: _activeColor));
  }
}
