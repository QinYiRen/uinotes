import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:uinotes/pages/search_app/search_app_view.dart';
import 'package:uinotes/pages/search_ocr/search_ocr_view.dart';
import '../../common/res.dart';
import '../../common/style.dart';
import '../../model/search_count_model.dart';
import '../../widget/keep_alive.dart';
import '../search_pin/search_pin_view.dart';
import 'search_list_controller.dart';

class SearchListPage extends GetView<SearchListController> {
  const SearchListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final parameters = Get.parameters;
    final name = parameters['name'];

    return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Get.back(result: name);
                  },
                  icon: SvgPicture.asset(R.icons.back)),
              actions: [
                Expanded(
                    child: GestureDetector(
                  onTap: () => Get.back(result: name),
                  child: Container(
                    width: double.infinity,
                    height: 44.h,
                    margin: EdgeInsets.only(right: 16.w, left: 58.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.w),
                      color: S.colors.bgColor,
                    ),
                    child: TextField(
                      enabled: false,
                      decoration: InputDecoration(
                        hintText: name,
                        hintStyle: TextStyle(
                            color: S.colors.appColor,
                            fontWeight: FontWeight.normal),
                        icon: Padding(
                            padding: EdgeInsets.only(left: 12.w),
                            child: SvgPicture.asset(R.icons.search)),
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.fromLTRB(0.w, 11.5.h, 20.w, 11.5.h),
                      ),
                    ),
                  ),
                ))
              ],
            ),
            body: Center(
              child: Column(
                children: [
                  FutureBuilder<List<Types>?>(
                    future: controller.getNum(name),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Types>?> snapshot) {
                      // 请求已结束
                      if (snapshot.connectionState == ConnectionState.none ||
                          snapshot.connectionState == ConnectionState.waiting) {
                        // 请求失败，显示错误
                        return TabBar(
                          tabs: <Tab>[
                            Tab(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  textBaseline: TextBaseline.ideographic,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 18.h, right: 4.w, bottom: 3.h),
                                      child: const Text('关键词'),
                                    ),
                                    Obx(() => Container(
                                          height: 3.h,
                                          width: 12.w,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color: controller.selectedTabIndex
                                                        .value ==
                                                    0
                                                ? S.colors.appColor
                                                : Colors.transparent,
                                          ),
                                        ))
                                  ],
                                ),
                                const Text(
                                  '?',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            )),
                            Tab(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 18.h, right: 4.w, bottom: 3.h),
                                      child: const Text(
                                        'OCR',
                                      ),
                                    ),
                                    Obx(() => Container(
                                          height: 3.h,
                                          width: 12.w,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color: controller.selectedTabIndex
                                                        .value ==
                                                    1
                                                ? S.colors.appColor
                                                : Colors.transparent,
                                          ),
                                        ))
                                  ],
                                ),
                                const Text(
                                  '?',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            )),
                            Tab(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 18.h, right: 4.w, bottom: 3.h),
                                      child: const Text('APP'),
                                    ),
                                    Obx(() => Container(
                                          height: 3.h,
                                          width: 12.w,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color: controller.selectedTabIndex
                                                        .value ==
                                                    2
                                                ? S.colors.appColor
                                                : Colors.transparent,
                                          ),
                                        ))
                                  ],
                                ),
                                const Text(
                                  '?',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            )),
                          ],
                          isScrollable: false,
                          padding: EdgeInsets.only(bottom: 12.h),
                          controller: controller.tabController,
                          labelColor: S.colors.textSelected,
                          labelStyle: TextStyle(
                              fontSize: 15,
                              color: S.colors.textSelected,
                              fontWeight: FontWeight.bold),
                          unselectedLabelColor: S.colors.textUnSelected,
                          unselectedLabelStyle: TextStyle(
                              fontSize: 15,
                              color: S.colors.textUnSelected,
                              fontWeight: FontWeight.normal),
                          indicatorColor: S.colors.appColor,
                          indicator: const BoxDecoration(),
                        );
                      } else if (snapshot.hasError) {
                        return TabBar(
                          tabs: <Tab>[
                            Tab(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  textBaseline: TextBaseline.ideographic,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 18.h, right: 4.w, bottom: 3.h),
                                      child: const Text('关键词'),
                                    ),
                                    Obx(() => Container(
                                          height: 3.h,
                                          width: 12.w,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color: controller.selectedTabIndex
                                                        .value ==
                                                    0
                                                ? S.colors.appColor
                                                : Colors.transparent,
                                          ),
                                        ))
                                  ],
                                ),
                                const Text(
                                  '?',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            )),
                            Tab(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 18.h, right: 4.w, bottom: 3.h),
                                      child: const Text(
                                        'OCR',
                                      ),
                                    ),
                                    Obx(() => Container(
                                          height: 3.h,
                                          width: 12.w,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color: controller.selectedTabIndex
                                                        .value ==
                                                    1
                                                ? S.colors.appColor
                                                : Colors.transparent,
                                          ),
                                        ))
                                  ],
                                ),
                                const Text(
                                  '?',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            )),
                            Tab(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 18.h, right: 4.w, bottom: 3.h),
                                      child: const Text('APP'),
                                    ),
                                    Obx(() => Container(
                                          height: 3.h,
                                          width: 12.w,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color: controller.selectedTabIndex
                                                        .value ==
                                                    2
                                                ? S.colors.appColor
                                                : Colors.transparent,
                                          ),
                                        ))
                                  ],
                                ),
                                const Text(
                                  '?',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            )),
                          ],
                          isScrollable: false,
                          padding: EdgeInsets.only(bottom: 12.h),
                          controller: controller.tabController,
                          labelColor: S.colors.textSelected,
                          labelStyle: TextStyle(
                              fontSize: 15,
                              color: S.colors.textSelected,
                              fontWeight: FontWeight.bold),
                          unselectedLabelColor: S.colors.textUnSelected,
                          unselectedLabelStyle: TextStyle(
                              fontSize: 15,
                              color: S.colors.textUnSelected,
                              fontWeight: FontWeight.normal),
                          indicatorColor: S.colors.appColor,
                          indicator: const BoxDecoration(),
                        );
                      } else {
                        // 请求成功，显示数据
                        return TabBar(
                          tabs: <Tab>[
                            Tab(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  textBaseline: TextBaseline.ideographic,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 18.h, right: 4.w, bottom: 3.h),
                                      child: const Text('关键词'),
                                    ),
                                    Obx(() => Container(
                                          height: 3.h,
                                          width: 12.w,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color: controller.selectedTabIndex
                                                        .value ==
                                                    0
                                                ? S.colors.appColor
                                                : Colors.transparent,
                                          ),
                                        ))
                                  ],
                                ),
                                Text(
                                  '${snapshot.data![0].typeNum}',
                                  style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            )),
                            Tab(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 18.h, right: 4.w, bottom: 3.h),
                                      child: const Text(
                                        'OCR',
                                      ),
                                    ),
                                    Obx(() => Container(
                                          height: 3.h,
                                          width: 12.w,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color: controller.selectedTabIndex
                                                        .value ==
                                                    1
                                                ? S.colors.appColor
                                                : Colors.transparent,
                                          ),
                                        ))
                                  ],
                                ),
                                Text(
                                  '${snapshot.data![1].typeNum}',
                                  style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            )),
                            Tab(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 18.h, right: 4.w, bottom: 3.h),
                                      child: const Text('APP'),
                                    ),
                                    Obx(() => Container(
                                          height: 3.h,
                                          width: 12.w,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color: controller.selectedTabIndex
                                                        .value ==
                                                    2
                                                ? S.colors.appColor
                                                : Colors.transparent,
                                          ),
                                        ))
                                  ],
                                ),
                                Text(
                                  '${snapshot.data![2].typeNum}',
                                  style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            )),
                          ],
                          isScrollable: false,
                          padding: EdgeInsets.only(bottom: 12.h),
                          controller: controller.tabController,
                          labelColor: S.colors.textSelected,
                          labelStyle: TextStyle(
                              fontSize: 15,
                              color: S.colors.textSelected,
                              fontWeight: FontWeight.bold),
                          unselectedLabelColor: S.colors.textUnSelected,
                          unselectedLabelStyle: TextStyle(
                              fontSize: 15,
                              color: S.colors.textUnSelected,
                              fontWeight: FontWeight.normal),
                          indicatorColor: S.colors.appColor,
                          indicator: const BoxDecoration(),
                        );
                      }
                    },
                  ),
                  Expanded(
                      child: TabBarView(
                    controller: controller.tabController,
                    children: [
                      KeepAliveWrapper(
                          child: SearchPinPage(
                        wd: name!,
                      )),
                      KeepAliveWrapper(
                          child: SearchOcrPage(
                        wd: name,
                      )),
                      KeepAliveWrapper(child: SearchAppPage(wd: name)),
                    ],
                  ))
                ],
              ),
            ));
  }
}
