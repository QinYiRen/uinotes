import 'dart:async';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:image_pickers/image_pickers.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ImageSaveUtil {
  // 检查权限
  static Future<bool> checkPermission() async {
    // 获取设备信息
    var deviceInfo = await DeviceInfoPlugin().androidInfo;
    Permission permissionToRequest;

    // 根据设备信息判断需要请求哪个权限
    if (defaultTargetPlatform == TargetPlatform.android &&
        deviceInfo.version.sdkInt <= 32) {
      permissionToRequest = Permission.storage;
    } else {
      permissionToRequest = Permission.photos;
    }

    var status = await permissionToRequest.status;
    if (status.isGranted) {
      // 已经授权
      return true;
    } else if (status.isDenied || status.isPermanentlyDenied) {
      // 未授权或者永久拒绝授权，请求权限
      var result = await permissionToRequest.request();
      return result.isGranted;
    } else {
      // 其他情况，例如用户拒绝授权但是没有选择“永久拒绝”
      return false;
    }
  }

  static Future<void> saveImageToGallery(String imageUrl) async {
    try {
      // 检查权限
      bool hasPermission = await checkPermission();
      if (!hasPermission) {
        // 没有权限，需要提示用户授权
        openAppSettings();
      } else {
        // 保存图片到相册
        final result = await ImagePickers.saveImageToGallery(imageUrl);
        EasyLoading.showProgress(0.3, status: '下载中...');
        if (result != null) {
          // 图片保存成功
          EasyLoading.showSuccess('已保存本地相册');
        } else {
          // 图片保存失败
          EasyLoading.showError('保存本地相册失败');
        }
      }
    } catch (e) {
      // 异常处理
      EasyLoading.showError('Error saving image: $e');
    } finally {
      // 隐藏加载提示
      EasyLoading.dismiss();
    }
  }
}
