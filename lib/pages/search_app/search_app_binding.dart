import 'package:get/get.dart';
import 'search_app_controller.dart';

class SearchAppBinding extends Bindings {
    @override
    void dependencies() {
    Get.lazyPut<SearchAppController>(() => SearchAppController());
    }
}
