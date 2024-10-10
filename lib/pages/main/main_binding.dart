import 'package:get/get.dart';
import 'package:uinotes/pages/app_list/app_list_controller.dart';
import 'package:uinotes/pages/my/my_controller.dart';
import '../home/home_controller.dart';
import '../single_page/single_page_controller.dart';
import 'main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<MyController>(() => MyController());
    Get.lazyPut<SinglePageController>(() => SinglePageController());
    Get.lazyPut<AppListController>(() => AppListController());
  }
}
