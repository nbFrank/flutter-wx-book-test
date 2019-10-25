import 'package:flutter/material.dart';

import 'content_pager.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;
  int _currentIndex = 0;
  final ContentPageController _contentPageController = ContentPageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color(0xffedeef0),
            Color(0xffe6e7e9),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
//        child: Center(
//          child: Text(
//            '你点击了第$_currentIndex个Tab',
//            style: TextStyle(fontSize: 36, color: Colors.blue),
//          ),
//        ),
        child: ContentPager(
          contentPageController: _contentPageController,
          onPageChanged: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            //控制内容区域滚动到指定位置
            _contentPageController.jumpToPage(index);
            //修改状态
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            _bottomItemItem("本周", Icons.folder, 0),
            _bottomItemItem("分享", Icons.explore, 1),
            _bottomItemItem("免费", Icons.donut_small, 2),
            _bottomItemItem("长安", Icons.person, 3),
          ]),
    );
  }

  //封装底部Tab
  _bottomItemItem(String title, IconData icon, int index) {
    return BottomNavigationBarItem(
      icon: Icon(icon, color: _defaultColor),
      activeIcon: Icon(icon, color: _activeColor),
      title: Text(title,
          style: TextStyle(
              color: _currentIndex != index ? _defaultColor : _activeColor)),
    );
  }
}
