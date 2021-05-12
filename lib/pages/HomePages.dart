/*
 * @Author: Wang Huzhen
 * @Version: 1.0
 * @FilePath: \yigua\lib\pages\HomePages.dart
 * @Email: 2327253081@qq.com
 * @Date: 2021-05-12 21:08:53
 */
import 'package:flutter/material.dart';
import 'package:yigua/components/myDrawer.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          title: Text('一卦 易卦'),
          actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
        ),
        body: DoubleBackToCloseApp(
            snackBar: SnackBar(
              content: Text('再点一次退出程序'),
            ),
            child: Container(
              child: ListView(
                children: [],
              ),
            )),
      ),
    );
  }
}
