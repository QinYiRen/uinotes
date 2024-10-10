import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:uinotes/common/style.dart';
import '../../common/res.dart';
import 'setting_controller.dart';

class SettingPage extends GetView<SettingController> {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text('设置',
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
          padding: EdgeInsets.fromLTRB(20.w, 32.h, 20.w, 8.h),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  width: 100.w,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: SvgPicture.asset(
                          R.icons.icon,
                          width: 60.w,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text('UI Notes',
                          style: TextStyle(
                              fontSize: 13,
                              color: S.colors.appColor,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 4.h,
                      ),
                      Obx(() => Text(controller.version.value,
                          style: TextStyle(
                              fontSize: 13,
                              color: S.colors.textUnSelected,
                              fontWeight: FontWeight.normal)))
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Column(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Get.toNamed('/account');
                        },
                        child: SizedBox(
                          height: 60.h,
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '账号设置',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: S.colors.appColor,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                              SvgPicture.asset(R.icons.arrowRight)
                            ],
                          ),
                        )),
                    GestureDetector(
                        onTap: () {
                          Get.toNamed('/exchange');
                        },
                        child: SizedBox(
                          height: 60.h,
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '兑换会员',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: S.colors.appColor,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                              SvgPicture.asset(R.icons.arrowRight)
                            ],
                          ),
                        )),
                    GestureDetector(
                        onTap: () {
                          Get.toNamed('/userAgreement');
                        },
                        child: SizedBox(
                          height: 60.h,
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '用户协议',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: S.colors.appColor,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                              SvgPicture.asset(R.icons.arrowRight)
                            ],
                          ),
                        )),
                    GestureDetector(
                        onTap: () {
                          Get.toNamed('/privacy');
                        },
                        child: SizedBox(
                          height: 60.h,
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '隐私政策',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: S.colors.appColor,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                              SvgPicture.asset(R.icons.arrowRight)
                            ],
                          ),
                        )),
                    GestureDetector(
                        onTap: () {
                          Get.toNamed('/suggestion');
                        },
                        child: SizedBox(
                          height: 60.h,
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '意见反馈',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: S.colors.appColor,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                              SvgPicture.asset(R.icons.arrowRight)
                            ],
                          ),
                        )),
                    GestureDetector(
                        onTap: () {
                          Get.toNamed('/about');
                        },
                        child: SizedBox(
                          height: 60.h,
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '关于我们',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: S.colors.appColor,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                              SvgPicture.asset(R.icons.arrowRight)
                            ],
                          ),
                        )),
                  ],
                ),
                Expanded(
                    child: Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.only(bottom: 10.h),
                  child: TextButton(
                    style: TextButton.styleFrom(
                        minimumSize: const Size(327, 54),
                        backgroundColor: Colors.white,
                        side: BorderSide(
                            color: S.colors.textUnSelected, width: 0.5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    child: Text('退出登录',
                        style: TextStyle(
                            fontSize: 16,
                            color: S.colors.appColor,
                            fontWeight: FontWeight.normal)),
                    onPressed: () {
                      controller.signOut();
                    },
                  ),
                ))
              ],
            ),
          )),
    );
  }
}
