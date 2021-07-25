/*
 * @Author: Wang Huzhen
 * @Version: 1.0
 * @FilePath: \yigua\lib\pages\clock.dart
 * @Email: 2327253081@qq.com
 * @Date: 2021-07-19 21:54:57
 */
import 'dart:async';
import 'package:flutter/material.dart';
import '../utils/locationUtil.dart';

class Clock extends StatefulWidget {
  const Clock({Key key}) : super(key: key);

  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  LocationUtil _lc = LocationUtil();
  StreamSubscription<Map<String, Object>> _locationListener;

  @override
  void initState() {
    super.initState();
    // 动态申请定位权限
    _lc.requestPermission();
    // 注册定位结果监听
    _locationListener = _lc.locationPlugin
        .onLocationChanged()
        .listen((Map<String, Object> result) {
      setState(() {
        _lc.locationResult = result;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    //移除定位监听
    if (null != _locationListener) {
      _locationListener?.cancel();
    }
    //销毁定位
    _lc.locationPlugin.destroy();
  }

  Container _createButtonContainer() {
    return new Container(
        alignment: Alignment.center,
        child: new Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new ElevatedButton(
              onPressed: _lc.startLocation,
              child: new Text('开始定位'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                foregroundColor: MaterialStateProperty.all(Colors.white),
              ),
            ),
            new Container(width: 20.0),
            new ElevatedButton(
              onPressed: _lc.stopLocation,
              child: new Text('停止定位'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                foregroundColor: MaterialStateProperty.all(Colors.white),
              ),
            )
          ],
        ));
  }

  Widget _resultWidget(key, value) {
    return new Container(
      child: new Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Container(
            alignment: Alignment.centerRight,
            width: 100.0,
            child: new Text('$key :'),
          ),
          new Container(width: 5.0),
          new Flexible(child: new Text('$value', softWrap: true)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = <Widget>[];
    widgets.add(_createButtonContainer());

    if (_lc.locationResult != null) {
      _lc.locationResult?.forEach((key, value) {
        widgets.add(_resultWidget(key, value));
      });
    }

    return new MaterialApp(
        home: new Scaffold(
      appBar: new AppBar(
        title: new Text('AMap Location plugin example app'),
      ),
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: widgets,
      ),
    ));
  }
}
