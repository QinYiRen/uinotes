import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:uinotes/pages/home/home_view.dart';

import '../../http/request_api.dart';

class RegisterController extends GetxController {
  var isAgree = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  changeAgree(bool? value) {
    isAgree.value = value!;
  }

  register(String email, String password, String passwordConfirm,
      String verification) async {
    if (isAgree.isFalse) {
      EasyLoading.showInfo('请勾选并同意协议', duration: const Duration(seconds: 1));
    } else if (email.isEmpty || !isValidEmail(email)) {
      EasyLoading.showInfo('请输入有效的邮箱地址', duration: const Duration(seconds: 1));
    } else if (verification.isEmpty) {
      EasyLoading.showInfo('请输入验证码', duration: const Duration(seconds: 1));
    } else if (password.isEmpty) {
      EasyLoading.showInfo('请输入密码', duration: const Duration(seconds: 1));
    } else if (passwordConfirm.isEmpty) {
      EasyLoading.showInfo('请再次输入密码', duration: const Duration(seconds: 1));
    } else if (password != passwordConfirm) {
      EasyLoading.showInfo('密码输入不一致', duration: const Duration(seconds: 1));
    } else {
      // 如果所有条件都满足，则执行登录操作
      var res = await RequestRepository.signUpApi(
          email, password, passwordConfirm, verification);
      if (res != null) {
        if (res.status == 200) {
          EasyLoading.showSuccess('注册成功');
          Get.to(const HomePage(),transition: Transition.leftToRight);
        } else {
          EasyLoading.showError(res.msg ?? '注册失败');
        }
      }
    }
  }

  getVerification(String email) async {
    if (email.isEmpty || !isValidEmail(email)) {
      EasyLoading.showInfo('请输入有效的邮箱地址', duration: const Duration(seconds: 1));
    } else {
      await RequestRepository.signVerificatiionApi(email);
    }
  }

// 检查邮箱格式是否有效的函数
  bool isValidEmail(String email) {
    // 使用正则表达式检查邮箱格式
    // 这里简单起见，你可以根据需要修改为更复杂的正则表达式
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }
}
