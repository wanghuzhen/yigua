/*
 * @Author: Wang Huzhen
 * @Version: 1.0
 * @FilePath: \yigua\lib\main.dart
 * @Email: 2327253081@qq.com
 * @Date: 2021-05-12 20:48:46
 */
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:yigua/pages/Description.dart';
import 'package:yigua/pages/GuaAll.dart';
import 'package:yigua/utils/permission/permissionHandler.dart';
import 'pages/HomePages.dart';

void main() {
  if (Platform.isAndroid) {
    // 这一步设置状态栏颜色为透明
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
  }
  runApp(MyApp());
  List<Permission> permissions = [Permission.storage];
  PermissionHelper.check(permissions, onSuccess: () {
    print('onSuccess');
  }, onFailed: () {
    print('onFailed');
  }, onOpenSetting: () {
    print('onOpenSetting');
    openAppSettings();
  });
}

class MyApp extends StatelessWidget {
  final Map<String, WidgetBuilder> _routes = {
    '/': (BuildContext context) => HomePage(),
    '/description': (BuildContext context) => Description(),
    '/gua': (context) => GuaALL(),
  };

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '阅读',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        final String name = settings.name;
        final Function pageBuilder = _routes[name];
        if (pageBuilder != null) {
          if (settings.arguments != null) {
            // 如果透传了参数
            return MaterialPageRoute(
                builder: (context) =>
                    pageBuilder(context, arguments: settings.arguments));
          } else {
            // 没有透传参数
            return MaterialPageRoute(
                builder: (context) => pageBuilder(context));
          }
        }
        return MaterialPageRoute(builder: (context) => HomePage());
      },
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
    );
  }
}
