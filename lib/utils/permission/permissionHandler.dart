/*
 * @Author: Wang Huzhen
 * @Version: 1.0
 * @FilePath: \yigua\lib\utils\permission\permissionHandler.dart
 * @Email: 2327253081@qq.com
 * @Date: 2021-07-10 16:36:59
 */
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHelper {
  static VoidCallback defaultCall = () {};

  ///检查权限
  static void check(List<Permission> permissionList,
      {String errMsg,
      VoidCallback onSuccess,
      VoidCallback onFailed,
      VoidCallback onOpenSetting}) async {
    bool flag = true;
    for (var value in permissionList) {
      var status = await value.status;
      if (!status.isGranted) {
        flag = false;
        break;
      }
    }
    if (!flag) {
      PermissionStatus permissionStatus =
          await requestPermission(permissionList);
      if (permissionStatus.isGranted) {
        onSuccess != null ? onSuccess() : defaultCall();
      } else if (permissionStatus.isDenied) {
        onFailed != null ? onFailed() : defaultCall();
      } else if (permissionStatus.isPermanentlyDenied) {
        onOpenSetting != null ? onOpenSetting() : defaultCall();
      } else if (permissionStatus.isRestricted) {
        //IOS单独处理
        onOpenSetting != null ? onOpenSetting() : defaultCall();
      } else if (permissionStatus.isLimited) {
        //IOS单独处理
        onOpenSetting != null ? onOpenSetting() : defaultCall();
      }
    }
  }

  //申请权限
  static Future<PermissionStatus> requestPermission(
      List<Permission> permissionList) async {
    Map<Permission, PermissionStatus> statuses = await permissionList.request();
    PermissionStatus currentPermissionStatus = PermissionStatus.granted;
    statuses.forEach((key, value) {
      if (!value.isGranted) {
        currentPermissionStatus = value;
        return;
      }
    });
    return currentPermissionStatus;
  }
}
