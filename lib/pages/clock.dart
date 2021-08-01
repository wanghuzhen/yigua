/*
 * @Author: Wang Huzhen
 * @Version: 1.0
 * @FilePath: \yigua\lib\pages\clock.dart
 * @Email: 2327253081@qq.com
 * @Date: 2021-07-19 21:54:57
 */
import 'dart:async';
import 'dart:ui';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:solar_calculator/solar_calculator.dart';
import 'package:yigua/components/SunPainter.dart';
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
  Map time = {
    '【子时】': null,
    '【丑时】': null,
    '【寅时】': null,
    '【卯时】': null,
    '【辰时】': null,
    '【巳时】': null,
    '【午时】': null,
    '【未时】': null,
    '【申时】': null,
    '【酉时】': null,
    '【戌时】': null,
    '【亥时】': null,
  };
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
        _getTime(calc.sunTransitTime.toString());
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

  _getTime(sunTranTime) {
    var startTime =
        DateTime.parse(sunTranTime).toLocal().add(Duration(hours: -1));

    var endTime = DateTime.parse(sunTranTime).toLocal().add(Duration(hours: 1));
    time['【子时】'] = '${formatDate(startTime.add(Duration(hours: -12)), [
          HH,
          ':',
          nn,
          ':',
          ss,
          ' ',
        ])}-${formatDate(startTime.add(Duration(hours: -10)), [
          HH,
          ':',
          nn,
          ':',
          ss,
          ' ',
        ])}';
    time['【丑时】'] = '${formatDate(startTime.add(Duration(hours: -10)), [
          HH,
          ':',
          nn,
          ':',
          ss,
          ' ',
        ])}-${formatDate(startTime.add(Duration(hours: -8)), [
          HH,
          ':',
          nn,
          ':',
          ss,
          ' ',
        ])}';
    time['【寅时】'] = '${formatDate(startTime.add(Duration(hours: -8)), [
          HH,
          ':',
          nn,
          ':',
          ss,
          ' ',
        ])}-${formatDate(startTime.add(Duration(hours: -6)), [
          HH,
          ':',
          nn,
          ':',
          ss,
          ' ',
        ])}';
    time['【卯时】'] = '${formatDate(startTime.add(Duration(hours: -6)), [
          HH,
          ':',
          nn,
          ':',
          ss,
          ' ',
        ])}-${formatDate(startTime.add(Duration(hours: -4)), [
          HH,
          ':',
          nn,
          ':',
          ss,
          ' ',
        ])}';
    time['【辰时】'] = '${formatDate(startTime.add(Duration(hours: -4)), [
          HH,
          ':',
          nn,
          ':',
          ss,
          ' ',
        ])}-${formatDate(startTime.add(Duration(hours: -2)), [
          HH,
          ':',
          nn,
          ':',
          ss,
          ' ',
        ])}';
    time['【巳时】'] = '${formatDate(startTime.add(Duration(hours: -2)), [
          HH,
          ':',
          nn,
          ':',
          ss,
          ' ',
        ])}-${formatDate(startTime, [
          HH,
          ':',
          nn,
          ':',
          ss,
          ' ',
        ])}';
    time['【午时】'] = '${formatDate(startTime, [
          HH,
          ':',
          nn,
          ':',
          ss,
          ' ',
        ])}-${formatDate(endTime, [
          HH,
          ':',
          nn,
          ':',
          ss,
          ' ',
        ])}';
    time['【未时】'] = '${formatDate(endTime, [
          HH,
          ':',
          nn,
          ':',
          ss,
          ' ',
        ])}-${formatDate(endTime.add(Duration(hours: 2)), [
          HH,
          ':',
          nn,
          ':',
          ss,
          ' ',
        ])}';
    time['【申时】'] = '${formatDate(endTime.add(Duration(hours: 2)), [
          HH,
          ':',
          nn,
          ':',
          ss,
          ' ',
        ])}-${formatDate(endTime.add(Duration(hours: 4)), [
          HH,
          ':',
          nn,
          ':',
          ss,
          ' ',
        ])}';
    time['【酉时】'] = '${formatDate(endTime.add(Duration(hours: 4)), [
          HH,
          ':',
          nn,
          ':',
          ss,
          ' ',
        ])}-${formatDate(endTime.add(Duration(hours: 6)), [
          HH,
          ':',
          nn,
          ':',
          ss,
          ' ',
        ])}';
    time['【戌时】'] = '${formatDate(endTime.add(Duration(hours: 6)), [
          HH,
          ':',
          nn,
          ':',
          ss,
          ' ',
        ])}-${formatDate(endTime.add(Duration(hours: 8)), [
          HH,
          ':',
          nn,
          ':',
          ss,
          ' ',
        ])}';
    time['【亥时】'] = '${formatDate(endTime.add(Duration(hours: 8)), [
          HH,
          ':',
          nn,
          ':',
          ss,
          ' ',
        ])}-${formatDate(endTime.add(Duration(hours: 10)), [
          HH,
          ':',
          nn,
          ':',
          ss,
          ' ',
        ])}';
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
                      alignment: Alignment(0, -0.26),
                      child: SizedBox(
                        height: 170,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 6),
                              height: 140,
                              width: Global.screenWidth - 40,
                              child: CustomPaint(
                                painter: SunSetRisePainter(
                                    calc.sunriseTime.toString().split(' ')[1],
                                    calc.sunsetTime.toString().split(' ')[1]),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Text(
                                    "日出 ${calc.sunriseTime.toString().split(' ')[1]}",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 20),
                                  child: Text(
                                    "日落 ${calc.sunsetTime.toString().split(' ')[1]}",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.94, 1.2),
                      child: Container(
                        margin: EdgeInsets.all(10),
                        height: 300,
                        child: Text(
                          '时间',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.94, 0.84),
                      child: Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          '【子时】${time['【子时】']}\n【丑时】${time['【丑时】']}\n【寅时】${time['【寅时】']}\n【卯时】${time['【卯时】']}\n【辰时】${time['【辰时】']}\n【巳时】${time['【巳时】']}\n【午时】${time['【午时】']}\n【未时】${time['【未时】']}\n【申时】${time['【申时】']}\n【酉时】${time['【酉时】']}\n【戌时】${time['【戌时】']}\n【亥时】${time['【亥时】']}',
                          maxLines: 14,
                          style: TextStyle(
                            color: Colors.black,
                          ),
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
