import 'package:get/get.dart';
import 'search_box_controller.dart';

class SearchBoxBinding extends Bindings {
    @override
    void dependencies() {
    Get.lazyPut<SearchBoxController>(() => SearchBoxController());
    }
}
