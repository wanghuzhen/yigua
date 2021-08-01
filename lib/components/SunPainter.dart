/*
 * @Author: Wang Huzhen
 * @Version: 1.0
 * @FilePath: \yigua\lib\components\SunPainter.dart
 * @Email: 2327253081@qq.com
 * @Date: 2021-07-31 22:39:58
 */
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';
import 'package:yigua/utils/Uiutils.dart';

class SunSetRisePainter extends CustomPainter {
  final String sunriseTime;
  final String sunsetTime;
  double ratio;
  double marginTop = -40;
  double marginBottom = 20;
  double marginLeftRight = 20;

  Paint _paint = Paint();
  Path _path = Path();

  int getMinute(String time) {
    if (time != null && time.isNotEmpty) {
      int hour = int.parse(time.split(":")[0]);
      int minute = int.parse(time.split(":")[1]);
      return hour * 60 + minute;
    }
    return 0;
  }

  SunSetRisePainter(this.sunriseTime, this.sunsetTime) {
    int sunriseMinute = getMinute(sunriseTime);
    int sunsetMinute = getMinute(sunsetTime);
    int nowMinute = DateTime.now().hour * 60 + DateTime.now().minute;
    int resultMinute = max(sunriseMinute, min(sunsetMinute, nowMinute));
    ratio = (resultMinute - sunriseMinute).toDouble() /
        (sunsetMinute - sunriseMinute);
  }

  @override
  void paint(Canvas canvas, Size size) {
    var height = size.height;
    var width = size.width;
    double startX = marginLeftRight;
    double startY = height - marginBottom;
    double endX = width - marginLeftRight;
    double endY = startY;
    _path.reset();
    _path.moveTo(startX, startY);
    _path.quadraticBezierTo(width / 2, marginTop, endX, endY);
    _paint.color = Colors.white;
    _paint.style = PaintingStyle.stroke;
    _paint.strokeWidth = 1.5;
    canvas.drawPath(
        dashPath(_path, dashArray: CircularIntervalList<double>([10, 5])),
        _paint);

    var metrics = _path.computeMetrics();
    var pm = metrics.elementAt(0);
    Offset sunOffset = pm.getTangentForOffset(pm.length * ratio).position;
    canvas.save();
    canvas.clipRect(Rect.fromLTWH(0, 0, sunOffset.dx, height));
    canvas.drawPath(_path, _paint);
    canvas.restore();

    _paint.style = PaintingStyle.fill;
    _paint.color = Colors.yellow;
    canvas.drawCircle(sunOffset, 6, _paint);

    var now = DateTime.now();
    String nowTimeStr = "${now.hour}:${now.minute}";
    var nowTimePara = UiUtils.getParagraph(nowTimeStr, 14);
    canvas.drawParagraph(nowTimePara,
        Offset(sunOffset.dx - nowTimePara.width / 2, sunOffset.dy + 10));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
