/*
 * @Author: Wang Huzhen
 * @Version: 1.0
 * @FilePath: \yigua\lib\global.dart
 * @Email: 2327253081@qq.com
 * @Date: 2021-05-16 19:20:41
 */
import 'dart:ui';
import 'package:flutter/material.dart';

class Global {
  static Global instance = Global();
  // 屏幕信息
  static MediaQueryData mediaQueryData = MediaQueryData.fromWindow(window);
  static double screenWidth = mediaQueryData.size.width;
  static double screenHeight = mediaQueryData.size.height;
  static double paddingBottom = mediaQueryData.padding.bottom;
  static double paddingTop = mediaQueryData.padding.top;
  static List guaList_1 = ['乾', '兑', '离', '震', '巽', '坎', '艮', '坤'];
  static List guaList_2 = [
    [
      '第一卦 乾为天',
      '第十卦 天泽履',
      '第十三卦 天火同人',
      '第二十五卦 天雷无妄',
      '第四十四卦 天风姤',
      '第六卦 天水讼',
      '第三十三卦 天山遁',
      '第十二卦 天地否'
    ],
    [
      '第四十三卦 泽天夬',
      '第五十八卦 兑为泽',
      '第四十九卦 泽火革',
      '第十七卦 泽雷随',
      '第二十八卦 泽风大过',
      '第四十七卦 泽水困',
      '第三十一卦 泽山咸',
      '第四十五卦 天地否'
    ],
    [
      '第十四卦 火天大有',
      '第三十八卦 火泽睽',
      '第三十卦 离为火',
      '第二十一卦 火雷噬嗑',
      '第五十卦 火风鼎',
      '第六十四卦 火水未济',
      '第五十六卦 火山旅',
      '第三十五卦 火地晋'
    ],
    [
      '第三十四卦 雷天大壮',
      '第五十四卦 雷泽归妹',
      '第五十五卦 雷火丰',
      '第五十一卦 震为雷',
      '第三十二卦 雷风恒',
      '第四十卦 雷水解',
      '第六十二卦 雷山小过',
      '第十六卦 雷地豫'
    ],
    [
      '第九卦 风天小畜',
      '第六十一卦 风泽中孚',
      '第三十七卦 风火家人',
      '第四十二卦 风雷益',
      '第五十七卦 巽为风',
      '第五十九卦 风水涣',
      '第五十三卦 风山渐',
      '第二十卦 风地观'
    ],
    [
      '第五卦 水天需',
      '第六十卦 水泽节',
      '第六十三卦 水火既济',
      '第三卦 水雷屯',
      '第四十八卦 水风井',
      '第二十九卦 坎为水',
      '第三十九卦 水山蹇',
      '第八卦 水地比'
    ],
    [
      '第二十六卦 山天大畜',
      '第四十一卦 山泽损',
      '第二十二卦 山火贲',
      '第二十七卦 山雷颐',
      '第十八卦 山风蛊',
      '第四卦 山水蒙',
      '第五十二卦 艮为山',
      '第二十三卦 山地剥'
    ],
    [
      '第十一卦 地天泰',
      '第十九卦 地泽临',
      '第三十六卦 地火明夷',
      '第二十四卦 地雷复',
      '第四十六卦 地风升',
      '第七卦 地水师',
      '第十五卦 地山谦',
      '第二卦 坤为地'
    ],
  ];
}
