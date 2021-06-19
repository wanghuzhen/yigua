/*
 * @Author: Wang Huzhen
 * @Version: 1.0
 * @FilePath: \yigua\lib\pages\GuaAll.dart
 * @Email: 2327253081@qq.com
 * @Date: 2021-05-16 18:13:06
 */
import 'package:flutter/material.dart';
import 'package:yigua/components/LiuYao.dart';
import 'package:yigua/global.dart';

class GuaALL extends StatefulWidget {
  final int up;
  final int down;
  final String guaName;
  GuaALL({Key key, this.up, this.down, this.guaName}) : super(key: key);

  @override
  _GuaALLState createState() => _GuaALLState();
}

class _GuaALLState extends State<GuaALL> {
  String reverse(input) {
    return input.split('').reversed.join();
  }

  binaryArray(num1, num2) {
    var _liuYao = reverse(num1.toRadixString(2).padLeft(3, '0')) +
        reverse(num2.toRadixString(2).padLeft(3, '0'));
    return _liuYao;
  }

  getHugua(int up, int down) {
    var strYao = binaryArray(up, down);
    var upstr = reverse(strYao.substring(1, 4));
    var downstr = reverse(strYao.substring(2, 5));
    return [int.parse(upstr, radix: 2), int.parse(downstr, radix: 2)];
  }

  getBiangua(int up, int down, int index) {
    var strYao = binaryArray(up, down);
    var tmp =
        strYao.replaceRange(index, index + 1, strYao[index] == '1' ? '0' : '1');
    return [
      int.parse(reverse(tmp.substring(0, 3)), radix: 2),
      int.parse(reverse(tmp.substring(3, 6)), radix: 2)
    ];
  }

  getCuogua(int up, int down) {
    var strYao = binaryArray(up, down);
    var tmp = '';
    for (var i = 0; i < 6; i++) {
      tmp += strYao[i] == '1' ? '0' : '1';
    }
    return [
      int.parse(reverse(tmp.substring(0, 3)), radix: 2),
      int.parse(reverse(tmp.substring(3, 6)), radix: 2)
    ];
  }

  getZonggua(int up, int down) {
    var strYao = binaryArray(up, down);
    var tmp = reverse(strYao);
    return [
      int.parse(reverse(tmp.substring(0, 3)), radix: 2),
      int.parse(reverse(tmp.substring(3, 6)), radix: 2)
    ];
  }

  @override
  Widget build(BuildContext context) {
    var huGua = getHugua(widget.up, widget.down);
    var bianGua = [];
    for (var i = 5; i >= 0; i--) {
      bianGua.add(getBiangua(widget.up, widget.down, i));
    }
    var cuoGua = getCuogua(widget.up, widget.down);
    var zongGua = getZonggua(widget.up, widget.down);
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.guaName),
        ),
        body: Container(
          width: Global.screenWidth,
          margin: EdgeInsets.all(5),
          child: Card(
            elevation: 5,
            child: ListView(
              children: [
                GuaDescription(
                  gua: '主卦',
                  up: widget.up,
                  down: widget.down,
                  name: Global.guaList_2[widget.up][widget.down].split(' ')[1],
                ),
                GuaDescription(
                  gua: '互卦',
                  up: huGua[0],
                  down: huGua[1],
                  name: Global.guaList_2[huGua[0]][huGua[1]].split(' ')[1],
                ),
                GuaDescription(
                  gua: '初九变卦',
                  up: bianGua[0][0],
                  down: bianGua[0][1],
                  name: Global.guaList_2[bianGua[0][0]][bianGua[0][1]]
                      .split(' ')[1],
                ),
                GuaDescription(
                  gua: '九二变卦',
                  up: bianGua[1][0],
                  down: bianGua[1][1],
                  name: Global.guaList_2[bianGua[1][0]][bianGua[1][1]]
                      .split(' ')[1],
                ),
                GuaDescription(
                  gua: '六三变卦',
                  up: bianGua[2][0],
                  down: bianGua[2][1],
                  name: Global.guaList_2[bianGua[2][0]][bianGua[2][1]]
                      .split(' ')[1],
                ),
                GuaDescription(
                  gua: '九四变卦',
                  up: bianGua[3][0],
                  down: bianGua[3][1],
                  name: Global.guaList_2[bianGua[3][0]][bianGua[3][1]]
                      .split(' ')[1],
                ),
                GuaDescription(
                  gua: '九五变卦',
                  up: bianGua[4][0],
                  down: bianGua[4][1],
                  name: Global.guaList_2[bianGua[4][0]][bianGua[4][1]]
                      .split(' ')[1],
                ),
                GuaDescription(
                  gua: '上六变卦',
                  up: bianGua[5][0],
                  down: bianGua[5][1],
                  name: Global.guaList_2[bianGua[5][0]][bianGua[5][1]]
                      .split(' ')[1],
                ),
                GuaDescription(
                  gua: '错卦',
                  up: cuoGua[0],
                  down: cuoGua[1],
                  name: Global.guaList_2[cuoGua[0]][cuoGua[1]].split(' ')[1],
                ),
                GuaDescription(
                  gua: '综卦',
                  up: zongGua[0],
                  down: zongGua[1],
                  name: Global.guaList_2[zongGua[0]][zongGua[1]].split(' ')[1],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GuaDescription extends StatefulWidget {
  final int up;
  final int down;
  final String gua;
  final String name;
  final String description;
  GuaDescription(
      {Key key, this.up, this.down, this.description, this.gua, this.name})
      : super(key: key);

  @override
  _GuaDescriptionState createState() => _GuaDescriptionState();
}

class _GuaDescriptionState extends State<GuaDescription> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 8, top: 8),
            child: Text(
              widget.gua + '：' + widget.name,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 8, top: 8),
                child: LiuYao(
                  up: widget.up,
                  down: widget.down,
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    '先天八卦：\n乾南，坤北，离东，坎西，兑东南，震东北，巽西南，艮西北。\n后天八卦：\n震东，兑西，离南，坎北，乾西北，坤西南，艮东北，巽东南。\n',
                    maxLines: 100,
                    style: TextStyle(
                      color: Color.fromRGBO(77, 99, 104, 1),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
