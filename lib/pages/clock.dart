/*
 * @Author: Wang Huzhen
 * @Version: 1.0
 * @FilePath: \yigua\lib\pages\clock.dart
 * @Email: 2327253081@qq.com
 * @Date: 2021-07-19 21:54:57
 */
import 'package:flutter/material.dart';
import 'package:yigua/global.dart';

class Clock extends StatefulWidget {
  const Clock({Key key}) : super(key: key);

  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Container(
            padding: EdgeInsets.only(left: 96),
            child: Text('十二时辰'),
          ),
        ),
        //TODO --制作页面确定时辰，日正±1h确定午时
        body: Container(
          child: Text(Global.dateTime),
        ),
      ),
    );
  }
}
