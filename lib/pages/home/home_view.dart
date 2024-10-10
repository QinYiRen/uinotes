import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:uinotes/common/res.dart';
import 'package:uinotes/common/style.dart';
import 'package:uinotes/pages/app_list/app_list_view.dart';
import 'package:uinotes/pages/single_page/single_page_view.dart';
import 'package:uinotes/widget/keep_alive.dart';
import 'package:uinotes/widget/responsive.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: Column(
        children: [
          Row(
            children: [
              Expanded(flex: 2, child: Container()),
              Expanded(
                  flex: 3,
                    child: TabBar(
                      tabs: controller.tabs,
                      isScrollable: true,
                      controller: controller.tabController,
                      labelColor: S.colors.textSelected,
                      labelStyle: TextStyle(
                          fontSize: 18,
                          color: S.colors.textSelected,
                          fontWeight: FontWeight.w800),
                      unselectedLabelColor: S.colors.textUnSelected,
                      unselectedLabelStyle: TextStyle(
                          fontSize: 17,
                          color: S.colors.textUnSelected,
                          fontWeight: FontWeight.w800),
                      indicatorColor: S.colors.appColor,
                      indicator: const BoxDecoration(),
                    ),
                  ),
              Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.only(right: 12.w),
                        child: IconButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onPressed: () => {Get.toNamed('/searchBox')},
                          icon: SvgPicture.asset(R.icons.search),
                        ),
                      )
                    ],
                  )),
            ],
          ),
          Expanded(
              child: TabBarView(
            controller: controller.tabController,
            children: [
              KeepAliveWrapper(child: SinglePagePage()),
              KeepAliveWrapper(child: AppListPage()),
            ],
          ))
        ],
      ),
      tablet: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
            child: Row(
              children: [
                Row(
                  children: [
                    ClipOval(
                        child: SvgPicture.asset(
                      R.icons.icon,
                      width: 42.w,
                    )),
                    Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: const Text(
                          'UI Notes',
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 60.w),
                  child: TabBar(
                    tabs: controller.tabs,
                    isScrollable: true,
                    controller: controller.tabController,
                    labelColor: S.colors.textSelected,
                    labelStyle: TextStyle(
                        fontSize: 19,
                        color: S.colors.textSelected,
                        fontWeight: FontWeight.w800),
                    unselectedLabelColor: S.colors.textUnSelected,
                    unselectedLabelStyle: TextStyle(
                        fontSize: 18,
                        color: S.colors.textUnSelected,
                        fontWeight: FontWeight.w800),
                    indicatorColor: S.colors.appColor,
                    indicator: const BoxDecoration(),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () => Get.toNamed('/searchBox'),
                  child: Container(
                    width: 243.w,
                    height: 44.h,
                    // color: S.colors.bgColor,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          6.w,
                        ),
                        color: S.colors.bgColor),
                    child: Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.w),
                            child: SvgPicture.asset(R.icons.search)),
                        Text(
                          '搜索截图和App...',
                          style: TextStyle(color: S.colors.textUnSelected),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: TabBarView(
            controller: controller.tabController,
            children: [
              KeepAliveWrapper(child: SinglePagePage()),
              KeepAliveWrapper(child: AppListPage()),
            ],
          ))
        ],
      ),
      landScapeTablet: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 32.w),
            child: Row(
              children: [
                Row(
                  children: [
                    ClipOval(
                      child: SvgPicture.asset(
                        R.icons.icon,
                        width: 42.w,
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: const Text(
                          'UI Notes',
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 80.w),
                  child: TabBar(
                    tabs: controller.tabs,
                    isScrollable: true,
                    controller: controller.tabController,
                    labelColor: S.colors.textSelected,
                    labelStyle: TextStyle(
                        fontSize: 19,
                        color: S.colors.textSelected,
                        fontWeight: FontWeight.w800),
                    unselectedLabelColor: S.colors.textUnSelected,
                    unselectedLabelStyle: TextStyle(
                        fontSize: 18,
                        color: S.colors.textUnSelected,
                        fontWeight: FontWeight.w800),
                    indicatorColor: S.colors.appColor,
                    indicator: const BoxDecoration(),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () => Get.toNamed('/searchBox'),
                  child: Container(
                    width: 330.w,
                    height: 44.h,
                    // color: S.colors.bgColor,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          6.w,
                        ),
                        color: S.colors.bgColor),
                    child: Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.w),
                            child: SvgPicture.asset(R.icons.search)),
                        Text(
                          '搜索截图和App...',
                          style: TextStyle(color: S.colors.textUnSelected),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: TabBarView(
            controller: controller.tabController,
            children: [
              KeepAliveWrapper(child: SinglePagePage()),
              KeepAliveWrapper(child: AppListPage()),
            ],
          ))
        ],
      ),
    );
  }
}
