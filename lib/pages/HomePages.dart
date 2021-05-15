/*
 * @Author: Wang Huzhen
 * @Version: 1.0
 * @FilePath: \yigua\lib\pages\HomePages.dart
 * @Email: 2327253081@qq.com
 * @Date: 2021-05-12 21:08:53
 */
import 'package:flutter/material.dart';
import 'package:yigua/components/LiuYao.dart';
import 'package:yigua/components/myDrawer.dart';

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
          body: Container(
            child: ListView(
              children: [],
            ),
          )),
    );
  }
}
