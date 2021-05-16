/*
 * @Author: Wang Huzhen
 * @Version: 1.0
 * @FilePath: \yigua\lib\components\GuaRes.dart
 * @Email: 2327253081@qq.com
 * @Date: 2021-05-15 22:27:05
 */
import 'package:flutter/material.dart';
import 'package:yigua/global.dart';
import 'package:yigua/pages/GuaAll.dart';
import 'LiuYao.dart';

class GuaRes extends StatefulWidget {
  final int up;
  final int down;
  GuaRes({Key key, this.up, this.down}) : super(key: key);

  @override
  _GuaResState createState() => _GuaResState();
}

class _GuaResState extends State<GuaRes> {
  @override
  Widget build(BuildContext context) {
    int _up = widget.up;
    int _down = widget.down;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: Global.screenWidth / 2,
          padding: EdgeInsets.fromLTRB(10, 5, 5, 0),
          height: 100,
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return GuaALL(
                  up: _up,
                  down: _down,
                  guaName: Global.guaList_2[_up][_down],
                );
              }));
            },
            child: Card(
              elevation: 3,
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10, top: 10),
                    child: LiuYao(
                      up: _up,
                      down: _down,
                    ),
                  ),
                  Container(
                    child: Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('上' +
                              Global.guaList_1[_up] +
                              '下' +
                              Global.guaList_1[_down]),
                          Text('易经' +
                              Global.guaList_2[_up][_down].split(' ')[0]),
                          Text(Global.guaList_2[_up][_down].split(' ')[1])
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Container(
          width: Global.screenWidth / 2,
          padding: EdgeInsets.fromLTRB(5, 5, 10, 0),
          height: 100,
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return GuaALL(
                  up: _up,
                  down: _down + 1,
                  guaName: Global.guaList_2[_up][_down + 1],
                );
              }));
            },
            child: Card(
              elevation: 3,
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10, top: 10),
                    child: LiuYao(
                      up: _up,
                      down: _down + 1,
                    ),
                  ),
                  Container(
                    child: Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('上' +
                            Global.guaList_1[_up] +
                            '下' +
                            Global.guaList_1[_down + 1]),
                        Text('易经' +
                            Global.guaList_2[_up][_down + 1].split(' ')[0]),
                        Text(Global.guaList_2[_up][_down + 1].split(' ')[1])
                      ],
                    )),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
