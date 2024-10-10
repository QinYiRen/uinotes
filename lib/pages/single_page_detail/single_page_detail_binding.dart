import 'package:get/get.dart';
import 'single_page_detail_controller.dart';

class SinglePageDetailBinding extends Bindings {
    @override
    void dependencies() {
    Get.lazyPut<SinglePageDetailController>(() => SinglePageDetailController());
    }
}
