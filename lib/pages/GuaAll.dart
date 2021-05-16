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
  List guaList_1 = ['乾', '兑', '离', '震', '巽', '坎', '艮', '坤'];

  @override
  Widget build(BuildContext context) {
    String allName = '上' +
        guaList_1[widget.up] +
        '下' +
        guaList_1[widget.down] +
        ' ' +
        widget.guaName;
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
                  gua: '主卦',
                  up: widget.up,
                  down: widget.down,
                  name: Global.guaList_2[widget.up][widget.down].split(' ')[1],
                ),
                GuaDescription(
                  gua: '主卦',
                  up: widget.up,
                  down: widget.down,
                  name: Global.guaList_2[widget.up][widget.down].split(' ')[1],
                ),
                GuaDescription(
                  gua: '主卦',
                  up: widget.up,
                  down: widget.down,
                  name: Global.guaList_2[widget.up][widget.down].split(' ')[1],
                ),
                GuaDescription(
                  gua: '主卦',
                  up: widget.up,
                  down: widget.down,
                  name: Global.guaList_2[widget.up][widget.down].split(' ')[1],
                ),
                GuaDescription(
                  gua: '主卦',
                  up: widget.up,
                  down: widget.down,
                  name: Global.guaList_2[widget.up][widget.down].split(' ')[1],
                ),
                GuaDescription(
                  gua: '主卦',
                  up: widget.up,
                  down: widget.down,
                  name: Global.guaList_2[widget.up][widget.down].split(' ')[1],
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
