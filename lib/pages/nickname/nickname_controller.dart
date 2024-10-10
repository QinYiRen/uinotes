import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uinotes/http/request_api.dart';

class NicknameController extends GetxController {
  SharedPreferences pref = Get.find();

  var count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    count.value = pref.getString('name')!.length;
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  setNickname(String nickname) async {
    var isOk = await RequestRepository.nicknameChangeApi(nickname);
    if (isOk) {
      pref.setString('name', nickname);
    }
  }
}
