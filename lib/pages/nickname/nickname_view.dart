import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../common/res.dart';
import '../../common/style.dart';
import 'nickname_controller.dart';

class NicknamePage extends GetView<NicknameController> {
  NicknamePage({Key? key}) : super(key: key);
  final TextEditingController _nicknameController = TextEditingController();
  SharedPreferences pref = Get.find();
  @override
  Widget build(BuildContext context) {
    _nicknameController.text = pref.getString('name')!;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text('编辑昵称',
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Expanded(
                  child: Container(
                      // width: 343.w,
                      height: 54.h,
                      margin: EdgeInsets.symmetric(horizontal: 20.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.w),
                        color: S.colors.bgColor,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              maxLength: 20,
                              maxLengthEnforcement:
                                  MaxLengthEnforcement.enforced,
                              onChanged: (value) {
                                controller.count.value = value.length;
                              },
                              controller: _nicknameController,
                              decoration: InputDecoration(
                                counterText: '',
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.fromLTRB(24.w, 10.h, 24.w, 10.h),
                              ),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.w),
                              child: Obx(
                                () => Text(
                                  '${controller.count.value}/20',
                                  style: TextStyle(
                                    color: S.colors.textUnSelected,
                                    fontSize: 16,
                                  ),
                                ),
                              ))
                        ],
                      )))
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
            child: Text('请设置2-20个字符，支持中英文、数字、以及不在首尾的下划线~',
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
                constraints: const BoxConstraints(minWidth: 327, minHeight: 54),
                fillColor: S.colors.appColor,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                onPressed: () {
                  controller.setNickname(_nicknameController.text);
                },
                child: const Text(
                  '保存昵称',
                  style: TextStyle(
                      fontSize: 17, letterSpacing: 1, color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
