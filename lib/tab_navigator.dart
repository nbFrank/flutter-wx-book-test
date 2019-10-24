import 'package:flutter/material.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
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
    ));
  }
}
