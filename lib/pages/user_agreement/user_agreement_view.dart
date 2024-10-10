import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../common/res.dart';
import '../../common/style.dart';
import 'user_agreement_controller.dart';

class UserAgreementPage extends GetView<UserAgreementController> {
  const UserAgreementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('用户协议',
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
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'UI Notes 用户协议',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.h),
            const Text(
              '     欢迎您访问我们的产品。UI Notes（以下简称“我们”）依据本协议为用户（以下简称“你”）提供UI Notes服务。本协议对你和我们均具有法律约束力。',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.h),
            const Text(
              '一、本服务的功能',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            const Text(
              '     你可以使用本服务UI页面搜索、APP登录注册、UI页面收藏等功能。',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.h),
            const Text(
              '二、责任范围及限制',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            const Text(
              '     你使用本服务得到的结果仅供参考，实际情况以官方为准。',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.h),
            const Text(
              '三、隐私保护',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            const Text(
              '     我们重视对你隐私的保护，你的个人隐私信息将根据《隐私政策》受到保护与规范，详情请参阅《隐私政策》。',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.h),
            const Text(
              '四、其他条款',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            const Text(
              '     本协议所有条款的标题仅为阅读方便，本身并无实际涵义，不能作为本协议涵义解释的依据。',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.h),
            const Text(
              '     本协议条款无论因何种原因部分无效或不可执行，其余条款仍有效，对双方具有约束力。',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 24.h),
            const Text(
              '更新日期',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            const Text(
              '本用户协议最后更新于2024年8月27日。',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
