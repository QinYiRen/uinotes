import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:uinotes/common/res.dart';
import 'package:uinotes/pages/home/home_view.dart';
import 'package:uinotes/pages/my/my_view.dart';
import '../../widget/bottom_navigation_bar_item_active_icon.dart';
import 'main_controller.dart';

class MainPage extends GetView<MainController> {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(toolbarHeight: 0),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          children: [const HomePage(), MyPage()],
        ),
        bottomNavigationBar: Obx(() => BottomNavigationBar(
              backgroundColor: Colors.white,
              currentIndex: controller.currentIndex.value,
              onTap: (value) {
                if (value == 1 &&
                    (controller.pref.getString('uinotes_jwt') == null ||
                        controller.pref.getString('uinotes_jwt') == '')) {
                  Get.toNamed('/login');
                } else {
                  controller.changeIndex(value);
                  controller.pageController.jumpToPage(value);
                }
              },
              selectedFontSize: 0.0,
              unselectedFontSize: 0.0,
              items: [
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(R.icons.home),
                    label: '',
                    activeIcon: CustomActiveIcon(iconPath: R.icons.home)),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(R.icons.my),
                    label: '',
                    activeIcon: CustomActiveIcon(iconPath: R.icons.my))
              ],
            )));
  }
}
