/*
 * @Author: Wang Huzhen
 * @Version: 1.0
 * @FilePath: \yigua\lib\utils\locationUtil.dart
 * @Email: 2327253081@qq.com
 * @Date: 2021-07-25 21:10:14
 */
import 'dart:async';
import 'package:amap_flutter_location/amap_flutter_location.dart';
import 'package:amap_flutter_location/amap_location_option.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationUtil {
  Map<String, Object> locationResult;
  AMapFlutterLocation locationPlugin = new AMapFlutterLocation();

  //设置定位参数
  void _setLocationOption() {
    AMapLocationOption locationOption = new AMapLocationOption();
    //是否单次定位
    locationOption.onceLocation = true;
    //是否需要返回地理信息
    locationOption.needAddress = true;
    //逆地理信息的语言类型
    locationOption.geoLanguage = GeoLanguage.DEFAULT;
    locationOption.fullAccuracyPurposeKey = "AMapLocationScene";
    //设置Android端的定位模式<br>
    //<li>[AMapLocationMode.Battery_Saving]</li>
    //<li>[AMapLocationMode.Device_Sensors]</li>
    //<li>[AMapLocationMode.Hight_Accuracy]</li>
    locationOption.locationMode = AMapLocationMode.Hight_Accuracy;
    //将定位参数设置给定位插件
    locationPlugin.setLocationOption(locationOption);
  }

  //开始定位
  void startLocation() {
    //开始定位之前设置定位参数
    _setLocationOption();
    locationPlugin.startLocation();
  }

  //停止定位
  void stopLocation() {
    locationPlugin.stopLocation();
  }

  //动态申请定位权限
  void requestPermission() async {
    // 申请权限
    bool hasLocationPermission = await requestLocationPermission();
    if (hasLocationPermission) {
      print("定位权限申请通过");
    } else {
      print("定位权限申请不通过");
    }
  }

  // 申请定位权限
  // 授予定位权限返回true， 否则返回false
  Future<bool> requestLocationPermission() async {
    //获取当前的权限
    var status = await Permission.location.status;
    if (status == PermissionStatus.granted) {
      //已经授权
      return true;
    } else {
      //未授权则发起一次申请
      status = await Permission.location.request();
      if (status == PermissionStatus.granted) {
        return true;
      } else {
        return false;
      }
    }
  }
}
