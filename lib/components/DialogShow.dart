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
  ShowDialog({Key key}) : super(key: key);

  @override
  _ShowDialogState createState() => _ShowDialogState();
}

class _ShowDialogState extends State<ShowDialog> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          SizedBox(
            height: Global.screenHeight * 0.05,
          ),
          Card(
            elevation: 3.0,
            child: Container(
              height: Global.screenHeight * 0.8,
              width: Global.screenWidth * 0.9,
              child: Text(''),
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.all(6),
                color: Colors.black45,
                child: Text(
                  '取消',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              )),
        ],
      ),
    );
  }
}
