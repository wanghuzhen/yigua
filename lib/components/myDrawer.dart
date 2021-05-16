/*
 * @Author: Wang Huzhen
 * @Version: 1.0
 * @FilePath: \yigua\lib\components\myDrawer.dart
 * @Email: 2327253081@qq.com
 * @Date: 2021-05-12 21:20:17
 */
//主页左上角抽屉
import 'package:flutter/material.dart';
import 'package:yigua/pages/Description.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          ListView(
            padding: EdgeInsets.only(top: 100),
            children: <Widget>[
              Container(
                child: Center(
                  child: TextUpDown(),
                ),
              ),
              DrawerItem(
                icon: Icons.color_lens,
                description: '主题',
                func: () {
                  //TODO
                  Navigator.pop(context);
                },
              ),
              DrawerItem(
                icon: Icons.settings,
                description: '设置',
                func: () {
                  Navigator.pop(context);
                },
              ),
              DrawerItem(
                icon: Icons.description_rounded,
                description: '介绍',
                func: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return Description();
                  }));
                },
              ),
              //TODO --制作页面确定时辰，日正±1h确定午时
              DrawerItem(
                icon: Icons.timer,
                description: '时辰',
                func: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              'QQ:2327253081',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

class TextUpDown extends StatelessWidget {
  const TextUpDown({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 80,
            child: Text(
              '一',
              style: TextStyle(fontSize: 40, fontFamily: 'shoujinti'),
            ),
          ),
          Container(
            width: 10,
          ),
          Container(
            child: Text(
              '卦',
              style: TextStyle(fontSize: 40, fontFamily: 'shoujinti'),
            ),
          ),
          Container(
            width: 20,
          ),
          Container(
            height: 80,
            child: Text(
              '易',
              style: TextStyle(fontSize: 40, fontFamily: 'shoujinti'),
            ),
          ),
          Container(
            width: 10,
          ),
          Container(
            child: Text(
              '卦',
              style: TextStyle(fontSize: 40, fontFamily: 'shoujinti'),
            ),
          ),
        ],
      ),
      // Text(
      //   '一卦',
      //   style: TextStyle(fontSize: 50, fontFamily: 'shoujinti'),
      // ),
    );
  }
}

class DrawerItem extends StatefulWidget {
  final IconData icon;
  final String description;
  final Function() func;
  DrawerItem({Key key, this.icon, this.description, this.func})
      : super(key: key);

  @override
  _DrawerItemState createState() => _DrawerItemState();
}

class _DrawerItemState extends State<DrawerItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: widget.func,
        child: Container(
          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: Card(
            elevation: 2.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  height: 50,
                  child: Icon(
                    widget.icon,
                    size: 30,
                  ),
                ),
                Text(
                  widget.description,
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
