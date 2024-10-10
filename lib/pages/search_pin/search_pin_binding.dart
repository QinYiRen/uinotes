import 'package:get/get.dart';
import 'search_pin_controller.dart';

class SearchPinBinding extends Bindings {
    @override
    void dependencies() {
    Get.lazyPut<SearchPinController>(() => SearchPinController());
    }
}
