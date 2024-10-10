import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../common/res.dart';
import '../../common/style.dart';
import 'exchange_controller.dart';

class ExchangePage extends GetView<ExchangeController> {
  ExchangePage({Key? key}) : super(key: key);
  final TextEditingController _code = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              centerTitle: true,
              title: Text('兑换会员',
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
            body: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 54.h,
                          margin: EdgeInsets.symmetric(horizontal: 20.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.w),
                            color: S.colors.bgColor,
                          ),
                          child: TextField(
                            controller: _code,
                            decoration: InputDecoration(
                              hintText: '请输入兑换码',
                              hintStyle: TextStyle(
                                  color: S.colors.textUnSelected,
                                  fontSize: 16,
                                  letterSpacing: 1),
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.fromLTRB(24.w, 14.h, 24.w, 10.h),
                            ),
                          ),
                        ),
                      )
                    ],
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
                          controller.exchangeVip(_code.text);
                        },
                        child: const Text(
                          '确认兑换',
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
