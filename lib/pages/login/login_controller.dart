import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uinotes/http/request_api.dart';
import 'package:uinotes/pages/main/main_view.dart';

class LoginController extends GetxController {
  var captcha = '<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" fill="none" version="1.1" width="113" height="56" viewBox="0 0 113 56"><defs><clipPath id="master_svg0_217_3908"><rect x="0" y="0" width="113" height="56" rx="0"/></clipPath></defs><g clip-path="url(#master_svg0_217_3908)"><rect x="0" y="0" width="113" height="56" rx="0" fill="#FAFAFA" fill-opacity="1"/></g></svg>'.obs;
  var isAgree = false.obs;
  SharedPreferences pref = Get.find();
  @override
  void onInit() {
    getCaptcha();
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  getCaptcha() async {
    var res = await RequestRepository.captchaApi();
    if (res != null) {
      captcha.value = res.data ?? '';
    }
  }

  changeAgree(bool? value) {
    isAgree.value = value!;
  }

  login(String email, String password, String captcha) async {
    if (isAgree.isFalse) {
      EasyLoading.showInfo('请勾选并同意协议', duration: const Duration(seconds: 1));
    } else if (email.isEmpty || !isValidEmail(email)) {
      EasyLoading.showInfo('请输入有效的邮箱地址', duration: const Duration(seconds: 1));
    } else if (password.isEmpty) {
      EasyLoading.showInfo('请输入密码', duration: const Duration(seconds: 1));
    } else if (captcha.isEmpty) {
      EasyLoading.showInfo('请输入验证码', duration: const Duration(seconds: 1));
    } else {
      // 如果所有条件都满足，则执行登录操作
      var res = await RequestRepository.signInApi(email, password, captcha);
      if (res.status == 200 || res.status == 100) {
        getName();
        EasyLoading.showSuccess('登录成功');
        Get.back();
      } else {
        EasyLoading.showError(res.msg!);
        getCaptcha();

      }
    }
  }

// 检查邮箱格式是否有效的函数
  bool isValidEmail(String email) {
    // 使用正则表达式检查邮箱格式
    // 这里简单起见，你可以根据需要修改为更复杂的正则表达式
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }


  getName() async {
    var res = await RequestRepository.settingApi();
    pref.setString('name', res['name']);
    pref.setString('avatar', res['avatar']);
    pref.setInt('isVip', res['isVip']);
    pref.setString('timeVip', res['timeVip']);
    pref.setString('email', res['email']);
  }
}
