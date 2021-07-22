/*
 * @Author: Wang Huzhen
 * @Version: 1.0
 * @FilePath: \yigua\lib\utils\FunctionUtils.dart
 * @Email: 2327253081@qq.com
 * @Date: 2021-06-23 21:31:38
 */
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:yigua/components/DialogShow.dart';
import 'package:location/location.dart';

class FunctionUtils {
  static void popDialog(BuildContext context, String text, String name) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return ShowDialog(
            text: text,
            name: name,
          );
        });
  }

  static getDate() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _locationData = await location.getLocation();
    var date;
    Response response;
    BaseOptions _options = BaseOptions(
      baseUrl: 'https://richurimo.bmcx.com/',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    var dio = Dio(_options);
    var url = _locationData.longitude.toString() +
        '__jw__' +
        _locationData.latitude.toString() +
        '__richurimo/';
    response = await dio.get(url);
    var dcoument = parse(response.data.toString());
    return date;
  }
}
