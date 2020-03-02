import 'package:flutter/material.dart';
import 'package:flutter_app1/pages/home_page.dart';
import 'package:flutter_app1/pages/my_page.dart';
import 'package:flutter_app1/pages/search_page.dart';
import 'package:flutter_app1/pages/travel_page.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final _controller = PageController(initialPage: 0);
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: <Widget>[
          HomePage(),
          SearchPage(),
          TravelPage(),
          MyPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        // 控制bar 缩放
        selectedFontSize: 14,
        // 点击字体大小
        unselectedFontSize: 14,
        // 未点击字体大小
        currentIndex: _currentIndex,
        // 监听哪一个item被选中
        onTap: (index) {
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          createItem(iconName: Icons.home, title: '首页'),
          createItem(iconName: Icons.search, title: '搜索'),
          createItem(iconName: Icons.book, title: '旅游'),
          createItem(iconName: Icons.person, title: 'me'),
        ],
      ),
    );
  }
}

// 导航子元素
BottomNavigationBarItem createItem({IconData iconName, String title}) {
  return BottomNavigationBarItem(
      icon: Icon(
        iconName,
        size: 30,
      ),
      title: Text(title));
}
