import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'package:uinotes/http/request_api.dart';

class PasswordController extends GetxController {
  var password = 0.obs;
  var passwordConfirm = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  setVerification() async {
    await RequestRepository.resetVerificationApi();
  }

  setPassword(password, verification, passwordConfirm) async {
    if (verification.isEmpty) {
      EasyLoading.showInfo('请输入验证码', duration: const Duration(seconds: 1));
    } else if (password.isEmpty) {
      EasyLoading.showInfo('请输入密码', duration: const Duration(seconds: 1));
    } else if (passwordConfirm.isEmpty) {
      EasyLoading.showInfo('请再次输入密码', duration: const Duration(seconds: 1));
    } else if (password != passwordConfirm) {
      EasyLoading.showInfo('密码输入不一致', duration: const Duration(seconds: 1));
    } else {
      await RequestRepository.resetApi(password, verification, passwordConfirm);
    }
  }
}
