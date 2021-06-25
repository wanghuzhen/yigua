/*
 * @Author: Wang Huzhen
 * @Version: 1.0
 * @FilePath: \yigua\lib\FunctionUtils.dart
 * @Email: 2327253081@qq.com
 * @Date: 2021-06-23 21:31:38
 */
import 'package:flutter/material.dart';
import 'package:yigua/components/DialogShow.dart';

class FunctionUtils {
  static void popDialog(BuildContext context, String text) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return ShowDialog(text: text);
        });
  }
}
