import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:uinotes/common/res.dart';
import 'package:uinotes/widget/responsive.dart';
import '../../common/style.dart';
import '../../widget/loopImage.dart';
import 'register_controller.dart';

class RegisterPage extends GetView<RegisterController> {
  RegisterPage({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();
  final TextEditingController _verificationController = TextEditingController();
  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  final FocusNode focusNode3 = FocusNode();
  final FocusNode focusNode4 = FocusNode();
  @override
  Widget build(BuildContext context) {
    if (context.isPhone) {
      ScreenUtil.init(context, designSize: const Size(375, 812));
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    } else if (context.isTablet) {
      if (context.isLandscape) {
        ScreenUtil.init(context, designSize: const Size(1194, 834));
      } else {
        ScreenUtil.init(context, designSize: const Size(834, 1194));
      }
    } else {
      ScreenUtil.init(context, designSize: const Size(375, 812));
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    }
    return Responsive(
        mobile: Scaffold(
          appBar: AppBar(toolbarHeight: 0),
          resizeToAvoidBottomInset: false,
          body: Stack(children: [
            const Positioned(
              top: 6,
              child: LoopImageColumn(),
            ),
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: SvgPicture.asset(R.icons.back)),
            Padding(
                padding: EdgeInsets.fromLTRB(32.w, 165.h, 32.w, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '注册送7天会员',
                      style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 4),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Listener(
                                onPointerDown: (event) {
                                  focusNode1.requestFocus();
                                },
                                child: Container(
                                  height: 56.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.w),
                                    color: S.colors.bgColor,
                                  ),
                                  child: TextField(
                                    focusNode: focusNode1,
                                    controller: _emailController,
                                    decoration: InputDecoration(
                                      hintText: '请输入邮箱',
                                      hintStyle: TextStyle(
                                          color: S.colors.textUnSelected,
                                          fontSize: 16,
                                          letterSpacing: 1),
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.fromLTRB(
                                          24.w, 17.h, 24.w, 13.h),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 16.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      child: Listener(
                                    onPointerDown: (event) {
                                      focusNode2.requestFocus();
                                    },
                                    child: Container(
                                      width: 165.w,
                                      height: 56.h,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(6.w),
                                        color: S.colors.bgColor,
                                      ),
                                      child: TextField(
                                        focusNode: focusNode2,
                                        controller: _verificationController,
                                        decoration: InputDecoration(
                                          hintText: '请输入验证码',
                                          hintStyle: TextStyle(
                                              color: S.colors.textUnSelected,
                                              fontSize: 16,
                                              letterSpacing: 1),
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.fromLTRB(
                                              24.w, 17.h, 24.w, 13.h),
                                        ),
                                      ),
                                    ),
                                  )),
                                  SizedBox(
                                    width: 16.w,
                                  ),
                                  RawMaterialButton(
                                    constraints: BoxConstraints(
                                        minWidth: 124.w, minHeight: 54.h),
                                    fillColor: S.colors.appColor,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(6.0)),
                                    onPressed: () {
                                      controller.getVerification(
                                          _emailController.text);
                                    },
                                    child: const Text(
                                      '获取验证码',
                                      style: TextStyle(
                                          fontSize: 15,
                                          letterSpacing: 1,
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16.h),
                              Listener(
                                onPointerDown: (event) {
                                  focusNode3.requestFocus();
                                },
                                child: Container(
                                  height: 56.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.w),
                                    color: S.colors.bgColor,
                                  ),
                                  child: TextField(
                                    focusNode: focusNode3,
                                    controller: _passwordController,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      hintText: '请输入密码',
                                      hintStyle: TextStyle(
                                          color: S.colors.textUnSelected,
                                          fontSize: 16,
                                          letterSpacing: 1),
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.fromLTRB(
                                          24.w, 17.h, 24.w, 13.h),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 16.h),
                              Listener(
                                onPointerDown: (event) {
                                  focusNode4.requestFocus();
                                },
                                child: Container(
                                  height: 56.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.w),
                                    color: S.colors.bgColor,
                                  ),
                                  child: TextField(
                                    focusNode: focusNode4,
                                    controller: _passwordConfirmController,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      hintText: '请再次输入密码',
                                      hintStyle: TextStyle(
                                          color: S.colors.textUnSelected,
                                          fontSize: 16,
                                          letterSpacing: 1),
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.fromLTRB(
                                          24.w, 17.h, 24.w, 13.h),
                                    ),
                                  ),
                                ),
                              ),
                            ])),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10.h, horizontal: 4.w),
                      child: RawMaterialButton(
                        constraints: BoxConstraints(
                            minWidth: double.infinity, minHeight: 54.h),
                        fillColor: S.colors.appColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)),
                        onPressed: () {
                          controller.register(
                              _emailController.text,
                              _passwordController.text,
                              _passwordConfirmController.text,
                              _verificationController.text);
                        },
                        child: const Text(
                          '注册',
                          style: TextStyle(
                              fontSize: 18,
                              letterSpacing: 1,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 6.h, horizontal: 8.w),
                        child: RichText(
                            text: TextSpan(
                                text: '已有账号？',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: S.colors.textUnSelected),
                                children: <InlineSpan>[
                              WidgetSpan(
                                  alignment: PlaceholderAlignment.baseline,
                                  baseline: TextBaseline.alphabetic,
                                  child: GestureDetector(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: Text('立即登录',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: S.colors.appColor))))
                            ]))),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipOval(
                                child: SvgPicture.asset(
                                  R.icons.icon,
                                  width: 24.w,
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(left: 10.w),
                                  child: const Text(
                                    'UI Notes',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Transform.scale(
                                alignment: Alignment.lerp(
                                    const Alignment(-0, -1),
                                    const Alignment(2.3, 1.3),
                                    0.5),
                                scale: 0.8,
                                child: Obx(() => Checkbox(
                                    shape: const CircleBorder(),
                                    activeColor: S.colors.appColor,
                                    side: BorderSide(
                                        color: S.colors.textUnSelected),
                                    value: controller.isAgree.value,
                                    onChanged: (value) {
                                      controller.changeAgree(value);
                                    })),
                              ),
                              RichText(
                                  text: TextSpan(children: <InlineSpan>[
                                TextSpan(
                                    text: '已阅读并同意',
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: S.colors.textUnSelected)),
                                TextSpan(
                                    text: '《用户协议》',
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: S.colors.appColor)),
                                TextSpan(
                                    text: '和',
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: S.colors.textUnSelected)),
                                TextSpan(
                                    text: '《隐私政策》',
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: S.colors.appColor)),
                              ]))
                            ],
                          ),
                          SizedBox(height: 10.h)
                        ],
                      ),
                    ),
                  ],
                ))
          ]),
        ),
        tablet: Scaffold(
          appBar: AppBar(toolbarHeight: 0),
          resizeToAvoidBottomInset: false,
          body: Stack(children: [
            const Positioned(
              top: 6,
              child: LoopImageColumn(),
            ),
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: SvgPicture.asset(R.icons.back)),
            Padding(
                padding: EdgeInsets.fromLTRB(220.w, 180.h, 220.w, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '注册送7天会员',
                      style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 4),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Listener(
                                onPointerDown: (event) {
                                  focusNode1.requestFocus();
                                },
                                child: Container(
                                  height: 56.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.w),
                                    color: S.colors.bgColor,
                                  ),
                                  child: TextField(
                                    focusNode: focusNode1,
                                    controller: _emailController,
                                    decoration: InputDecoration(
                                      hintText: '请输入邮箱',
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
                              ),
                              SizedBox(height: 16.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      child: Listener(
                                    onPointerDown: (event) {
                                      focusNode2.requestFocus();
                                    },
                                    child: Container(
                                      width: 165.w,
                                      height: 56.h,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(6.w),
                                        color: S.colors.bgColor,
                                      ),
                                      child: TextField(
                                        focusNode: focusNode2,
                                        controller: _verificationController,
                                        decoration: InputDecoration(
                                          hintText: '请输入验证码',
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
                                  )),
                                  SizedBox(
                                    width: 16.w,
                                  ),
                                  RawMaterialButton(
                                    constraints: BoxConstraints(
                                        minWidth: 124.w, minHeight: 54.h),
                                    fillColor: S.colors.appColor,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(6.0)),
                                    onPressed: () {
                                      controller.getVerification(
                                          _emailController.text);
                                    },
                                    child: const Text(
                                      '获取验证码',
                                      style: TextStyle(
                                          fontSize: 15,
                                          letterSpacing: 1,
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16.h),
                              Listener(
                                onPointerDown: (event) {
                                  focusNode3.requestFocus();
                                },
                                child: Container(
                                  height: 56.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.w),
                                    color: S.colors.bgColor,
                                  ),
                                  child: TextField(
                                    focusNode: focusNode3,
                                    controller: _passwordController,
                                    obscureText: true,
                                    decoration: InputDecoration(
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
                              ),
                              SizedBox(height: 16.h),
                              Listener(
                                onPointerDown: (event) {
                                  focusNode4.requestFocus();
                                },
                                child: Container(
                                  height: 56.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.w),
                                    color: S.colors.bgColor,
                                  ),
                                  child: TextField(
                                    focusNode: focusNode4,
                                    controller: _passwordConfirmController,
                                    obscureText: true,
                                    decoration: InputDecoration(
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
                              ),
                            ])),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10.h, horizontal: 4.w),
                      child: RawMaterialButton(
                        constraints: BoxConstraints(
                            minWidth: double.infinity, minHeight: 54.h),
                        fillColor: S.colors.appColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)),
                        onPressed: () {
                          controller.register(
                              _emailController.text,
                              _passwordController.text,
                              _passwordConfirmController.text,
                              _verificationController.text);
                        },
                        child: const Text(
                          '注册',
                          style: TextStyle(
                              fontSize: 18,
                              letterSpacing: 1,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 6.h, horizontal: 8.w),
                        child: RichText(
                            text: TextSpan(
                                text: '已有账号？',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: S.colors.textUnSelected),
                                children: <InlineSpan>[
                              WidgetSpan(
                                  alignment: PlaceholderAlignment.baseline,
                                  baseline: TextBaseline.alphabetic,
                                  child: GestureDetector(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: Text('立即登录',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: S.colors.appColor))))
                            ]))),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipOval(
                                child: SvgPicture.asset(
                                  R.icons.icon,
                                  width: 24.w,
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(left: 10.w),
                                  child: const Text(
                                    'UI Notes',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Transform.scale(
                                alignment: Alignment.lerp(
                                    const Alignment(-0, -1),
                                    const Alignment(2.3, 1.3),
                                    0.5),
                                scale: 0.8,
                                child: Obx(() => Checkbox(
                                    shape: const CircleBorder(),
                                    activeColor: S.colors.appColor,
                                    side: BorderSide(
                                        color: S.colors.textUnSelected),
                                    value: controller.isAgree.value,
                                    onChanged: (value) {
                                      controller.changeAgree(value);
                                    })),
                              ),
                              RichText(
                                  text: TextSpan(children: <InlineSpan>[
                                TextSpan(
                                    text: '已阅读并同意',
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: S.colors.textUnSelected)),
                                TextSpan(
                                    text: '《用户协议》',
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: S.colors.appColor)),
                                TextSpan(
                                    text: '和',
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: S.colors.textUnSelected)),
                                TextSpan(
                                    text: '《隐私政策》',
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: S.colors.appColor)),
                              ]))
                            ],
                          ),
                          SizedBox(height: 10.h)
                        ],
                      ),
                    ),
                  ],
                ))
          ]),
        ),
        landScapeTablet: Scaffold(
          appBar: AppBar(toolbarHeight: 0),
          resizeToAvoidBottomInset: false,
          body: Stack(children: [
            const Positioned(
              top: 6,
              child: LoopImageColumn(),
            ),
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: SvgPicture.asset(R.icons.back)),
            Padding(
                padding: EdgeInsets.fromLTRB(400.w, 175.h, 400.w, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '注册送7天会员',
                      style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 4),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Listener(
                                onPointerDown: (event) {
                                  focusNode1.requestFocus();
                                },
                                child: Container(
                                  height: 56.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.w),
                                    color: S.colors.bgColor,
                                  ),
                                  child: TextField(
                                    focusNode: focusNode1,
                                    controller: _emailController,
                                    decoration: InputDecoration(
                                      hintText: '请输入邮箱',
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
                              ),
                              SizedBox(height: 16.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      child: Listener(
                                    onPointerDown: (event) {
                                      focusNode2.requestFocus();
                                    },
                                    child: Container(
                                      width: 165.w,
                                      height: 56.h,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(6.w),
                                        color: S.colors.bgColor,
                                      ),
                                      child: TextField(
                                        focusNode: focusNode2,
                                        controller: _verificationController,
                                        decoration: InputDecoration(
                                          hintText: '请输入验证码',
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
                                  )),
                                  SizedBox(
                                    width: 16.w,
                                  ),
                                  RawMaterialButton(
                                    constraints: BoxConstraints(
                                        minWidth: 124.w, minHeight: 54.h),
                                    fillColor: S.colors.appColor,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(6.0)),
                                    onPressed: () {
                                      controller.getVerification(
                                          _emailController.text);
                                    },
                                    child: const Text(
                                      '获取验证码',
                                      style: TextStyle(
                                          fontSize: 15,
                                          letterSpacing: 1,
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16.h),
                              Listener(
                                onPointerDown: (event) {
                                  focusNode3.requestFocus();
                                },
                                child: Container(
                                  height: 56.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.w),
                                    color: S.colors.bgColor,
                                  ),
                                  child: TextField(
                                    focusNode: focusNode3,
                                    controller: _passwordController,
                                    obscureText: true,
                                    decoration: InputDecoration(
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
                              ),
                              SizedBox(height: 16.h),
                              Listener(
                                onPointerDown: (event) {
                                  focusNode4.requestFocus();
                                },
                                child: Container(
                                  height: 56.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.w),
                                    color: S.colors.bgColor,
                                  ),
                                  child: TextField(
                                    focusNode: focusNode4,
                                    controller: _passwordConfirmController,
                                    obscureText: true,
                                    decoration: InputDecoration(
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
                              ),
                            ])),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10.h, horizontal: 4.w),
                      child: RawMaterialButton(
                        constraints: BoxConstraints(
                            minWidth: double.infinity, minHeight: 54.h),
                        fillColor: S.colors.appColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)),
                        onPressed: () {
                          controller.register(
                              _emailController.text,
                              _passwordController.text,
                              _passwordConfirmController.text,
                              _verificationController.text);
                        },
                        child: const Text(
                          '注册',
                          style: TextStyle(
                              fontSize: 18,
                              letterSpacing: 1,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 6.h, horizontal: 8.w),
                        child: RichText(
                            text: TextSpan(
                                text: '已有账号？',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: S.colors.textUnSelected),
                                children: <InlineSpan>[
                              WidgetSpan(
                                  alignment: PlaceholderAlignment.baseline,
                                  baseline: TextBaseline.alphabetic,
                                  child: GestureDetector(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: Text('立即登录',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: S.colors.appColor))))
                            ]))),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipOval(
                                child: SvgPicture.asset(
                                  R.icons.icon,
                                  width: 24.w,
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(left: 10.w),
                                  child: const Text(
                                    'UI Notes',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Transform.scale(
                                alignment: Alignment.lerp(
                                    const Alignment(-0, -1),
                                    const Alignment(2.3, 1.3),
                                    0.5),
                                scale: 0.8,
                                child: Obx(() => Checkbox(
                                    shape: const CircleBorder(),
                                    activeColor: S.colors.appColor,
                                    side: BorderSide(
                                        color: S.colors.textUnSelected),
                                    value: controller.isAgree.value,
                                    onChanged: (value) {
                                      controller.changeAgree(value);
                                    })),
                              ),
                              RichText(
                                  text: TextSpan(children: <InlineSpan>[
                                TextSpan(
                                    text: '已阅读并同意',
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: S.colors.textUnSelected)),
                                TextSpan(
                                    text: '《用户协议》',
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: S.colors.appColor)),
                                TextSpan(
                                    text: '和',
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: S.colors.textUnSelected)),
                                TextSpan(
                                    text: '《隐私政策》',
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: S.colors.appColor)),
                              ]))
                            ],
                          ),
                          SizedBox(height: 10.h)
                        ],
                      ),
                    ),
                  ],
                ))
          ]),
        ));
  }
}
