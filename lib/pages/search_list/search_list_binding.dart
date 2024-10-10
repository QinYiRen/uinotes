import 'package:get/get.dart';
import 'package:uinotes/pages/search_app/search_app_controller.dart';
import 'package:uinotes/pages/search_ocr/search_ocr_controller.dart';
import 'package:uinotes/pages/search_pin/search_pin_controller.dart';
import 'search_list_controller.dart';

class SearchListBinding extends Bindings {
    @override
    void dependencies() {
    Get.lazyPut<SearchListController>(() => SearchListController());
    Get.lazyPut<SearchPinController>(() => SearchPinController());
    Get.lazyPut<SearchOcrController>(() => SearchOcrController());
    Get.lazyPut<SearchAppController>(() => SearchAppController());
    }
}
