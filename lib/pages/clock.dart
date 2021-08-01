/*
 * @Author: Wang Huzhen
 * @Version: 1.0
 * @FilePath: \yigua\lib\pages\clock.dart
 * @Email: 2327253081@qq.com
 * @Date: 2021-07-19 21:54:57
 */
import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:solar_calculator/solar_calculator.dart';
import 'package:yigua/components/SunPainter.dart';
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
          title: Text('时辰'),
        ),
        body: Card(
          //shape 设置边，可以设置圆角
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),

          elevation: 10.0,
          margin: EdgeInsets.all(10.0),
          child: calc == null
              ? SpinKitCircle(
                  color: Colors.pink[300],
                )
              : Stack(
                  children: [
                    Image.asset(
                      DateTime.now().isAfter(DateTime.parse(
                                  calc.sunriseTime.toString())) &&
                              DateTime.now().isBefore(
                                  DateTime.parse(calc.sunsetTime.toString()))
                          ? 'images/light.jpeg'
                          : 'images/dark.jpeg',
                      fit: BoxFit.fill,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                    Align(
                      alignment: Alignment(-0.8, -0.96),
                      child: SizedBox(
                        height: 80,
                        child: Column(
                          children: [
                            Text('日出：' +
                                calc.sunriseTime.toString().split(' +')[0]),
                            Text('日中：' +
                                calc.sunTransitTime.toString().split(' +')[0]),
                            Text('日落：' +
                                calc.sunsetTime.toString().split(' +')[0]),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0, -0.16),
                      child: Container(
                        child: CustomPaint(
                          painter: SunSetRisePainter(
                              calc.sunriseTime.toString().split(' ')[1],
                              calc.sunsetTime.toString().split(' ')[1]),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
