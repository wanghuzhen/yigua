/*
 * @Author: Wang Huzhen
 * @Version: 1.0
 * @FilePath: \yigua\lib\utils\DataUtils.dart
 * @Email: 2327253081@qq.com
 * @Date: 2021-07-20 22:27:17
 */
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesDataUtils {
  // 保存数据
  Future setInfo(key, value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(key, value);
  }

  // 获取数据
  Future getInfo(key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.containsKey(key) ? sp.getString(key) : null;
  }

  // 清除数据
  Future deleteInfo(key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove(key);
  }

  //清楚全部数据
  Future clearInfo(key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
  }
}
