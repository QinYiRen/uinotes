import 'package:get/get.dart';
import 'app_list_controller.dart';

class AppListBinding extends Bindings {
    @override
    void dependencies() {
    Get.lazyPut<AppListController>(() => AppListController());
    }
}
