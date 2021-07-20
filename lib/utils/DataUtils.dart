import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesDataUtils {
  // 保存数据
  Future setInfo(key, value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setStringList(key, value);
  }

  // 获取数据
  Future getInfo(key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.containsKey(key) ? sp.getStringList(key) : null;
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
