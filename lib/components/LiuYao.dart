/*
 * @Author: Wang Huzhen
 * @Version: 1.0
 * @FilePath: \yigua\lib\components\LiuYao.dart
 * @Email: 2327253081@qq.com
 * @Date: 2021-05-14 22:53:47
 */
import 'package:flutter/material.dart';

class LiuYao extends StatefulWidget {
  final int up;
  final int down;
  LiuYao({Key key, this.up = 0, this.down = 7}) : super(key: key);

  @override
  _LiuYaoState createState() => _LiuYaoState();
}

class _LiuYaoState extends State<LiuYao> {
  @override
  Widget build(BuildContext context) {
    int up = widget.up;
    int down = widget.down;
    return Container(
        child: Column(
      children: [
        Gua(
          guaNum: up,
        ),
        Gua(
          guaNum: down,
        )
      ],
    ));
  }
}

class Gua extends StatefulWidget {
  final int guaNum;

  const Gua({Key key, this.guaNum}) : super(key: key);
  @override
  _GuaState createState() => _GuaState();
}

class _GuaState extends State<Gua> {
  @override
  //此处有return
  // ignore: missing_return
  Widget build(BuildContext context) {
    switch (widget.guaNum) {
      case 0:
        return Container(
          child: Column(children: [
            Container(
              padding: EdgeInsets.only(bottom: 6),
              child: CustomPaint(
                size: Size(48, 6),
                painter: MyPainter(),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 6),
              child: CustomPaint(
                size: Size(48, 6),
                painter: MyPainter(),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 6),
              child: CustomPaint(
                size: Size(48, 6),
                painter: MyPainter(),
              ),
            )
          ]),
        );
        break;
      case 1:
        return Container(
          child: Column(children: [
            Container(
              padding: EdgeInsets.only(bottom: 6),
              child: CustomPaint(
                size: Size(48, 6),
                painter: MyPainter2(),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 6),
              child: CustomPaint(
                size: Size(48, 6),
                painter: MyPainter(),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 6),
              child: CustomPaint(
                size: Size(48, 6),
                painter: MyPainter(),
              ),
            )
          ]),
        );
        break;
      case 2:
        return Container(
          child: Column(children: [
            Container(
              padding: EdgeInsets.only(bottom: 6),
              child: CustomPaint(
                size: Size(48, 6),
                painter: MyPainter(),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 6),
              child: CustomPaint(
                size: Size(48, 6),
                painter: MyPainter2(),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 6),
              child: CustomPaint(
                size: Size(48, 6),
                painter: MyPainter(),
              ),
            )
          ]),
        );
        break;
      case 3:
        return Container(
          child: Column(children: [
            Container(
              padding: EdgeInsets.only(bottom: 6),
              child: CustomPaint(
                size: Size(48, 6),
                painter: MyPainter2(),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 6),
              child: CustomPaint(
                size: Size(48, 6),
                painter: MyPainter2(),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 6),
              child: CustomPaint(
                size: Size(48, 6),
                painter: MyPainter(),
              ),
            )
          ]),
        );
        break;
      case 4:
        return Container(
          child: Column(children: [
            Container(
              padding: EdgeInsets.only(bottom: 6),
              child: CustomPaint(
                size: Size(48, 6),
                painter: MyPainter(),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 6),
              child: CustomPaint(
                size: Size(48, 6),
                painter: MyPainter(),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 6),
              child: CustomPaint(
                size: Size(48, 6),
                painter: MyPainter2(),
              ),
            )
          ]),
        );
        break;
      case 5:
        return Container(
          child: Column(children: [
            Container(
              padding: EdgeInsets.only(bottom: 6),
              child: CustomPaint(
                size: Size(48, 6),
                painter: MyPainter2(),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 6),
              child: CustomPaint(
                size: Size(48, 6),
                painter: MyPainter(),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 6),
              child: CustomPaint(
                size: Size(48, 6),
                painter: MyPainter2(),
              ),
            )
          ]),
        );
        break;
      case 6:
        return Container(
          child: Column(children: [
            Container(
              padding: EdgeInsets.only(bottom: 6),
              child: CustomPaint(
                size: Size(48, 6),
                painter: MyPainter(),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 6),
              child: CustomPaint(
                size: Size(48, 6),
                painter: MyPainter2(),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 6),
              child: CustomPaint(
                size: Size(48, 6),
                painter: MyPainter2(),
              ),
            )
          ]),
        );
        break;
      case 7:
        return Container(
          child: Column(children: [
            Container(
              padding: EdgeInsets.only(bottom: 6),
              child: CustomPaint(
                size: Size(48, 6),
                painter: MyPainter2(),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 6),
              child: CustomPaint(
                size: Size(48, 6),
                painter: MyPainter2(),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 6),
              child: CustomPaint(
                size: Size(48, 6),
                painter: MyPainter2(),
              ),
            )
          ]),
        );
        break;
    }
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1.0
      ..style = PaintingStyle.fill
      ..color = Colors.black
      ..invertColors = false;
    Rect rect = Rect.fromLTWH(0.0, 0.0, 40, 6);
    canvas.drawRect(rect, paint);
  }

  //在实际场景中正确利用此回调可以避免重绘开销，本示例我们简单的返回true
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class MyPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1.0
      ..style = PaintingStyle.fill
      ..color = Colors.black
      ..invertColors = false;
    Rect rect = Rect.fromLTWH(0.0, 0.0, 17, 6);
    canvas.drawRect(rect, paint);
    rect = Rect.fromLTWH(23, 0.0, 17, 6);
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(MyPainter2 oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(MyPainter2 oldDelegate) => true;
}
