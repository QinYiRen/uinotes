import 'package:get/get.dart';
import 'single_page_controller.dart';

class SinglePageBinding extends Bindings {
    @override
    void dependencies() {
    Get.lazyPut<SinglePageController>(() => SinglePageController());
    }
}
