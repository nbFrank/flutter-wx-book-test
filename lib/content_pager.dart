import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wx_book_test_app/card_recommend.dart';

import 'custom_appbar.dart';

class ContentPager extends StatefulWidget {
  // 回调方法属性 ValueChanged
  final ValueChanged<int> onPageChanged;
  final ContentPageController contentPageController;

//  构造方法，可选参数，
  const ContentPager({Key key, this.onPageChanged, this.contentPageController})
      /*初始化列表*/
      : super(key: key);

  @override
  _ContentPagerState createState() => _ContentPagerState();
}

class _ContentPagerState extends State<ContentPager> {
  PageController _pageController = PageController(
      //视窗比例
      viewportFraction: 0.8);
  static List<Color> _colors = [
    Colors.blue,
    Colors.red,
    Colors.deepOrange,
    Colors.teal,
  ];

  @override
  void initState() {
    //第一个生命周期
    if (widget.contentPageController != null) {
      widget.contentPageController._pageController = _pageController;
    }
    _statusBar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //appBar
        CustomAppBar(),
        Expanded(
          //高度撑开，否则在Column中没有高度会报错
          child: PageView(
            controller: _pageController,
            // 当两个类进行关联的时候，可以通过 widget. 来调用被关联的类的属性方法, widget 指向 State<>里面的类
            onPageChanged: widget.onPageChanged,
            children: <Widget>[
              _wrapItem(CardRecommend()),
              _wrapItem(CardRecommend()),
              _wrapItem(CardRecommend()),
              _wrapItem(CardRecommend())
//              _wrapItem(1),
//              _wrapItem(2),
//              _wrapItem(3),
            ],
          ),
        )
      ],
    );
  }

  Widget _wrapItem(Widget widget) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: widget,
    );
  }

//  状态栏样式-沉浸式状态栏
  _statusBar() {
    //黑色沉浸式状态栏，基于SystemUiOverlayStyle.dark修改了statusBarColor
    SystemUiOverlayStyle uiOverlayStyle = SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xFF333333),
      systemNavigationBarDividerColor: null,
      statusBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    );

    SystemChrome.setSystemUIOverlayStyle(uiOverlayStyle);
  }
}

//内容区域的控制器
class ContentPageController {
  PageController _pageController;

  void jumpToPage(int page) {
    //dart 编程技巧：安全的调用
    _pageController?.jumpToPage(page);
  }
}
