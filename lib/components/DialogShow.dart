/*
 * @Author: Wang Huzhen
 * @Version: 1.0
 * @FilePath: \yigua\lib\components\DialogShow.dart
 * @Email: 2327253081@qq.com
 * @Date: 2021-06-20 21:47:47
 */
import 'package:html/parser.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:yigua/global.dart';

class ShowDialog extends StatefulWidget {
  final String text;
  final String name;
  ShowDialog({Key key, this.text, this.name}) : super(key: key);

  @override
  _ShowDialogState createState() => _ShowDialogState();
}

class _ShowDialogState extends State<ShowDialog> {
  bool isFlase = false;
  @override
  void initState() {
    super.initState();
    getDescription();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
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
                    padding: EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            widget.name,
                            style: TextStyle(color: Colors.black, fontSize: 22),
                          ),
                        ),
                        Text(
                          widget.text,
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        )
                      ],
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

  Future getDescription() async {
    var url = Global.map1[widget.name.split('：')[1]];
    Response response;
    BaseOptions _options = BaseOptions(
      baseUrl: 'https://m.zhouyi.cc/zhouyi/yijing64/',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    var dio = Dio(_options);
    response = await dio.get(url);
    var dcoument = parse(response.data.toString());
  }
}
