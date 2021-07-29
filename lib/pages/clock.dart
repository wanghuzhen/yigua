/*
 * @Author: Wang Huzhen
 * @Version: 1.0
 * @FilePath: \yigua\lib\pages\clock.dart
 * @Email: 2327253081@qq.com
 * @Date: 2021-07-19 21:54:57
 */
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:solar_calculator/solar_calculator.dart';
import 'package:yigua/global.dart';
import '/utils/locationUtil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Clock extends StatefulWidget {
  const Clock({Key key}) : super(key: key);

  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  LocationUtil _lc = LocationUtil();
  StreamSubscription<Map<String, Object>> _locationListener;
  SolarCalculator calc;
  final instant = Instant(
      year: DateTime.now().year,
      month: DateTime.now().month,
      day: DateTime.now().day,
      hour: DateTime.now().hour,
      timeZoneOffset: 8.0);
  @override
  void initState() {
    super.initState();
    // 动态申请定位权限
    _lc.requestPermission();
    _lc.startLocation();
    // 注册定位结果监听
    _locationListener = _lc.locationPlugin
        .onLocationChanged()
        .listen((Map<String, Object> result) {
      setState(() {
        calc =
            SolarCalculator(instant, result['latitude'], result['longitude']);
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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back)),
        ),
        body: Container(
          child: Center(
            child: calc == null
                ? SpinKitFadingCircle(
                    color: Colors.pink[300],
                  )
                : Column(
                    children: [
                      Container(
                        width: Global.screenWidth,
                        height: 200,
                        padding: EdgeInsets.all(8),
                        child: Card(
                          color: Colors.grey[300],
                          elevation: 5.0,
                          child: Column(
                            children: [
                              Text(calc.sunriseTime.toString()),
                              Text(calc.sunTransitTime.toString()),
                              Text(calc.sunsetTime.toString()),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
