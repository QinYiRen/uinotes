import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../common/res.dart';
import '../../common/style.dart';
import 'password_controller.dart';

class PasswordPage extends GetView<PasswordController> {
  PasswordPage({Key? key}) : super(key: key);
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();
  final TextEditingController _verificationController = TextEditingController();
  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  final FocusNode focusNode3 = FocusNode();
  SharedPreferences pref = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              centerTitle: true,
              title: Text('修改密码',
                  style: TextStyle(
                      fontSize: 18,
                      color: S.colors.appColor,
                      fontWeight: FontWeight.normal)),
              leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: SvgPicture.asset(R.icons.back)),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                        height: 54.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.w),
                          color: S.colors.bgColor,
                        ),
                        child: TextField(
                          readOnly: true,
                          decoration: InputDecoration(
                            hintText: pref.getString('email'),
                            hintStyle: TextStyle(
                                color: S.colors.textUnSelected,
                                fontSize: 16,
                                letterSpacing: 1),
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.fromLTRB(24.w, 15.h, 24.w, 15.h),
                          ),
                        ),
                      ))
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Listener(
                          onPointerDown: (event) {
                            focusNode1.requestFocus();
                          },
                          child: Container(
                            width: 200.w,
                            height: 54.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.w),
                              color: S.colors.bgColor,
                            ),
                            child: TextField(
                              focusNode: focusNode1,
                              controller: _verificationController,
                              decoration: InputDecoration(
                                hintText: '请输入验证码',
                                hintStyle: TextStyle(
                                    color: S.colors.textUnSelected,
                                    fontSize: 16,
                                    letterSpacing: 1),
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.fromLTRB(24.w, 15.h, 24.w, 15.h),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 16.w,
                      ),
                      RawMaterialButton(
                        constraints:
                            const BoxConstraints(minWidth: 124, minHeight: 52),
                        fillColor: S.colors.appColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0)),
                        onPressed: () {
                          controller.setVerification();
                        },
                        child: const Text(
                          '获取验证码',
                          style: TextStyle(
                              fontSize: 16,
                              letterSpacing: 1,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      Expanded(
                        child: Listener(
                          onPointerDown: (event) {
                            focusNode2.requestFocus();
                          },
                          child: Container(
                              height: 54.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.w),
                                color: S.colors.bgColor,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      focusNode: focusNode2,
                                      controller: _passwordController,
                                      onChanged: (value) {
                                        controller.password.value =
                                            value.length;
                                      },
                                      maxLength: 20,
                                      maxLengthEnforcement:
                                          MaxLengthEnforcement.enforced,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        counterText: '',
                                        hintText: '请输入密码',
                                        hintStyle: TextStyle(
                                            color: S.colors.textUnSelected,
                                            fontSize: 16,
                                            letterSpacing: 1),
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.fromLTRB(
                                            24.w, 15.h, 24.w, 15.h),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12.w),
                                      child: Obx(
                                        () => Text(
                                          '${controller.password.value}/20',
                                          style: TextStyle(
                                            color: S.colors.textUnSelected,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ))
                                ],
                              )),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      Expanded(
                          child: Listener(
                        onPointerDown: (event) {
                          focusNode3.requestFocus();
                        },
                        child: Container(
                            height: 54.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.w),
                              color: S.colors.bgColor,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    focusNode: focusNode3,
                                    controller: _passwordConfirmController,
                                    onChanged: (value) {
                                      controller.passwordConfirm.value =
                                          value.length;
                                    },
                                    maxLength: 20,
                                    maxLengthEnforcement:
                                        MaxLengthEnforcement.enforced,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      counterText: '',
                                      hintText: '请再次输入密码',
                                      hintStyle: TextStyle(
                                          color: S.colors.textUnSelected,
                                          fontSize: 16,
                                          letterSpacing: 1),
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.fromLTRB(
                                          24.w, 15.h, 24.w, 15.h),
                                    ),
                                  ),
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 12.w),
                                    child: Obx(() => Text(
                                          '${controller.passwordConfirm.value}/20',
                                          style: TextStyle(
                                            color: S.colors.textUnSelected,
                                            fontSize: 16,
                                          ),
                                        )))
                              ],
                            )),
                      ))
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
                    child: Text('请设置8-20个字符，必须包含大写、小写和数字~',
                        style: TextStyle(
                          color: S.colors.textUnSelected,
                          fontSize: 14,
                        )),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      margin: EdgeInsets.only(bottom: 10.h),
                      child: RawMaterialButton(
                        constraints:
                            const BoxConstraints(minWidth: 327, minHeight: 54),
                        fillColor: S.colors.appColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)),
                        onPressed: () {
                          controller.setPassword(
                              _passwordController.text,
                              _verificationController.text,
                              _passwordConfirmController.text);
                        },
                        child: const Text(
                          '确认修改',
                          style: TextStyle(
                              fontSize: 17,
                              letterSpacing: 1,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ));
  }
}
