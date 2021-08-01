/*
 * @Author: Wang Huzhen
 * @Version: 1.0
 * @FilePath: \yigua\lib\utils\Uiutils.dart
 * @Email: 2327253081@qq.com
 * @Date: 2021-07-31 22:42:48
 */
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class UiUtils {
  static ui.Paragraph getParagraph(String text, double textSize,
      {Color color = Colors.white, double itemWidth = 100}) {
    var pb = ui.ParagraphBuilder(ui.ParagraphStyle(
      textAlign: TextAlign.center, //居中
      fontSize: textSize, //大小
    ));
    pb.addText(text);
    pb.pushStyle(ui.TextStyle(color: color));
    var paragraph = pb.build()
      ..layout(ui.ParagraphConstraints(width: itemWidth));
    return paragraph;
  }
}
