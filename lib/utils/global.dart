import 'package:get/instance_manager.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Global {
  Future<void> init() async {
    await Get.putAsync(() => SharedPreferences.getInstance());
    await Get.putAsync(() => PackageInfo.fromPlatform());
  }
}
