/*
 * @Author: Wang Huzhen
 * @Version: 1.0
 * @FilePath: \yigua\lib\components\DialogShow.dart
 * @Email: 2327253081@qq.com
 * @Date: 2021-06-20 21:47:47
 */
import 'package:flutter/material.dart';
import 'package:yigua/global.dart';

class ShowDialog extends StatefulWidget {
  final String text;
  ShowDialog({Key key, this.text}) : super(key: key);

  @override
  _ShowDialogState createState() => _ShowDialogState();
}

class _ShowDialogState extends State<ShowDialog> {
  bool isFlase = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            clipBehavior: Clip.antiAlias,
            child: Container(
              height: Global.screenHeight * 0.75,
              width: Global.screenWidth * 0.86,
              child: Stack(
                children: [
                  Opacity(
                    opacity: 0.3,
                    child: Image.asset('images/Taichi.jpg',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity),
                  ),
                  Container(
                    child: Text(
                      widget.text,
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  )
                ],
              ),
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Image(
                height: 48,
                width: 48,
                image: AssetImage('images/cancel.png'),
              )),
        ],
      ),
    );
  }
}
