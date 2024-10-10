import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../common/res.dart';
import '../../common/style.dart';
import 'account_controller.dart';

class AccountPage extends GetView<AccountController> {
  AccountPage({Key? key}) : super(key: key);
  SharedPreferences pref = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('账号设置',
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
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    ClipOval(
                        child: Image(
                            width: 84.w,
                            image: CachedNetworkImageProvider(
                                pref.getString('avatar') ??
                                    'https://uinotes-img.oss-cn-shanghai.aliyuncs.com/user/avatar/user-default.png',
                                headers: const {
                                  'Referer': 'https://uinotes.com',
                                }))),
                    GestureDetector(
                        onTap: () {
                          EasyLoading.showToast('请在网页端上传头像');
                        },
                        child: SvgPicture.asset(R.icons.camera))
                  ],
                ),
                SizedBox(
                  height: 50.h,
                ),
                Column(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Get.toNamed('/nickname');
                        },
                        child: SizedBox(
                          height: 60.h,
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '用户昵称',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: S.colors.appColor,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    pref.getString('name')!,
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: S.colors.textUnSelected,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  SizedBox(width: 6.w),
                                  SvgPicture.asset(R.icons.arrowRight)
                                ],
                              )
                            ],
                          ),
                        )),
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
                                  '会员信息',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: S.colors.appColor,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    pref.get('isVip') == 1 ? pref.getString('timeVip')! : '未开通会员',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: S.colors.textUnSelected,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  SizedBox(width: 6.w),
                                  // SvgPicture.asset(R.icons.arrowRight)
                                ],
                              )
                            ],
                          ),
                        )),
                    GestureDetector(
                        onTap: () {
                          Get.toNamed('/password');
                        },
                        child: SizedBox(
                          height: 60.h,
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '修改密码',
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
              ],
            ),
          )),
    );
  }
}
