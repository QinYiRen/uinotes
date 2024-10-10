import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uinotes/http/request_api.dart';

class SettingController extends GetxController {
  SharedPreferences pref = Get.find();
  var version = ''.obs;
  @override
  void onInit() {
    super.onInit();
    getAppVersion();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    if (GetPlatform.isIOS) {
      version.value = 'iOS·${packageInfo.version}';
    } else {
      version.value = 'Android·${packageInfo.version}';
    }
  }

  signOut() async {
    await RequestRepository.signOutApi();
    pref.remove('uinotes_jwt');
    pref.remove('uinotes_svgInfo');
    pref.remove('name');
    pref.remove('avatar');
    pref.remove('isVip');
    pref.remove('timeVip');
    pref.remove('email');
    Get.offAllNamed('/main');
  }
}
