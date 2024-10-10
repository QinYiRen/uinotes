import 'package:get/get.dart';
import 'app_single_page_controller.dart';

class AppSinglePageBinding extends Bindings {
    @override
    void dependencies() {
    Get.lazyPut<AppSinglePageController>(() => AppSinglePageController());
    }
}
