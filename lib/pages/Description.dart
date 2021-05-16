/*
 * @Author: Wang Huzhen
 * @Version: 1.0
 * @FilePath: \yigua\lib\pages\Description.dart
 * @Email: 2327253081@qq.com
 * @Date: 2021-05-13 23:10:48
 */
import 'package:flutter/material.dart';
import 'package:yigua/components/LiuYao.dart';
import 'package:yigua/global.dart';

class Description extends StatefulWidget {
  Description({Key key}) : super(key: key);

  @override
  _DescriptionState createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Container(
            padding: EdgeInsets.only(left: 120),
            child: Text(
              '介绍',
            ),
          ),
        ),
        //TODO --更详细一点
        body: Container(
          padding: EdgeInsets.all(5),
          child: Card(
            elevation: 5,
            child: Container(
              height: Global.screenHeight,
              width: Global.screenWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10, top: 5),
                    child: Text(
                      '六爻',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, top: 10),
                    child: Row(
                      children: [
                        LiuYao(),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              '六爻由上卦三爻和下卦三爻组合而成。从下至上顺序依次为初爻、二爻、三爻、四爻、五爻、上爻。\n每一爻另分为阳爻和阴爻，全连为阳、中缺为阴。\n',
                              maxLines: 100,
                              style: TextStyle(
                                color: Color.fromRGBO(77, 99, 104, 1),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, top: 5),
                    child: Text(
                      '八卦',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, top: 10),
                    child: Row(
                      children: [
                        Container(
                          child: Image(
                            width: 190,
                            image: AssetImage('images/Gua.png'),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              '八卦，自北宋邵雍后分先天八卦与后天八卦。\n先天八卦：\n乾三连，坤六断，震仰盂，艮覆碗，离中虚，坎中满，兑上缺，巽下断。\n后天八卦：\n一数坎来二数坤，三震四巽是中分，五数中宫六乾是，七兑八艮九离门。\n',
                              maxLines: 100,
                              style: TextStyle(
                                color: Color.fromRGBO(77, 99, 104, 1),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, top: 5),
                    child: Text(
                      '八卦方位',
                      style: TextStyle(fontSize: 20),
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
                  Container(
                    padding: EdgeInsets.only(left: 10, top: 5),
                    child: Text(
                      '时间',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        '【子时】夜半、【丑时】鸡鸣、【寅时】平旦\n【卯时】日出、【辰时】食时、【巳时】隅中\n【午时】日中、【未时】日昳、【申时】哺时\n【酉时】日入、【戌时】黄昏、【亥时】人定',
                        maxLines: 100,
                        style: TextStyle(
                          color: Color.fromRGBO(77, 99, 104, 1),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
